package com.model2.mvcboard;

import com.common.DBConnPool;
import com.model1.BoardDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool {
    public MVCBoardDAO() {
        super();
    }

    //게시물 개수 반환
    public int selectCount(Map<String,Object> map){
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM mvcboard";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }

    //게시물 목록 반환
    public List<MVCBoardDTO> selectListPage(Map<String,Object>map){
        //쿼리 결과를 담을 변수
        List<MVCBoardDTO> bbs = new ArrayList<MVCBoardDTO>();

        //쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNUM FROM ("
                + " SELECT * FROM mvcboard";
        if(map.get("searchWord")!= null){
            query += " WHERE "  + map.get("searchFiled") + " "
                    +" LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY idx DESC"
                +" ) Tb"
                +" )"
                +" WHERE rNUM BETWEEN ? AND ? ";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while (rs.next()){
                //게시물 하나의 내용을 저장
                MVCBoardDTO dto = new MVCBoardDTO();
                System.out.println(rs.getString("name"));
                System.out.println(rs.getString("idx"));
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

                bbs.add(dto);
            }


        }catch (Exception e ){
            e.printStackTrace();
            System.out.println("selectListPage 오류 발생");
        }

        return bbs;
    }

    //게시글 작성
    public int insertWrite(MVCBoardDTO dto){
        int result =0;

        try {
            //쿼리 작성
            String query = "INSERT INTO mvcboard ( "
                    + "idx, name,title,content, ofile,sfile,pass)"
                    + "VALUES( "
                    + "seq_board_num.nextval, ?,?,?,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getName());
            psmt.setString(2,dto.getTitle());
            psmt.setString(3,dto.getContent());
            psmt.setString(4,dto.getOfile());
            psmt.setString(5,dto.getSfile());
            psmt.setString(6,dto.getPass());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("insertWrite 메소드 오류 발생");
            e.printStackTrace();
        }
        return result;
    }

    //게시글 상세보기
    public MVCBoardDTO selectView(String idx){
        MVCBoardDTO dto = new MVCBoardDTO();

        //쿼리 작성
        String query = "SELECT * "
                + " FROM mvcboard "
                + " WHERE idx = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();

            if(rs.next()){
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
            }
        }catch (Exception e){
            System.out.println("selectView 오류 발생");
            e.printStackTrace();
        }

        return dto;
    }

    //조회수 증가
    public void updateViewCount(String idx){
        //쿼리문
        String query = "UPDATE mvcboard SET "
                +"visitcount = visitcount +1"
                +" WHERE idx =?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();
        }catch (Exception e){
            System.out.println("updateViewCount 오류 발생");
            e.printStackTrace();
        }
    }

    //다운로드 수 증가
    public void updateDownCount(String idx){
        //쿼리문
        String query = "UPDATE mvcboard SET "
                +"downcount = downcount +1"
                +" WHERE idx =?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();
        }catch (Exception e){
            System.out.println("updateDownCount 오류 발생");
            e.printStackTrace();
        }
    }

    //입력한 비밀번호가 지정한 idx 게시물의 비밀번호와 일치하는 지 확인
    public boolean confirmPassword(String pass, String idx){
        boolean isCorr = true;

        try {
            String sql  = "SELECT COUNT(*) FROM mvcboard WHERE pass =? AND idx=?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1,pass);
            psmt.setString(2,idx);
            rs = psmt.executeQuery();

            rs.next();
            if(rs.getInt(1) == 0){
                isCorr = false;
            }
        }catch (Exception e){
            isCorr = false;
            System.out.println("confirmPassword 오류 발생");
            e.printStackTrace();
        }
        return isCorr;
    }

    //게시글 삭제
    public int deletePost(String idx){
        int result = 0;
        try {
            String query = "DELETE FROM mvcboard WHERE idx =?";
            psmt = con.prepareStatement(query);
            psmt.setString(1,idx);
            result = psmt.executeUpdate();

        }catch (Exception e){
            System.out.println("deletePost 오류 발생");
            e.printStackTrace();
        }
        return result;
    }

    //게시글 수정
    public int updatePost(MVCBoardDTO dto){
        int result =0;
        try {
            //쿼리문 작성
            String query = "UPDATE mvcboard"
                    + " SET title=?, name=?, content=?,ofile=?,sfile=?"
                    + " WHERE idx=? AND pass=?";

            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getName());
            psmt.setString(3,dto.getContent());
            psmt.setString(4,dto.getOfile());
            psmt.setString(5,dto.getSfile());
            psmt.setString(6,dto.getIdx());
            psmt.setString(7,dto.getPass());

            result = psmt.executeUpdate();
        }catch (Exception e){
            System.out.println("updatePost 오류 발생");
            e.printStackTrace();
        }

        return result;
    }
}
