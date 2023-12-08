package com.membership;

import com.common.DBConnPool;

public class MemberDAO extends DBConnPool {

    public MemberDAO(){
        super();
    }

    //받아온 파라미터로 아이디/패스워드 일치하는 회원정보 반환
    public MemberDTO getMemberDTO(String uid, String upass){

        MemberDTO dto = new MemberDTO();
        String sql = "SELECT * FROM member WHERE id =? AND pass =?";

        try {
            //쿼리 실행
            psmt = con.prepareStatement(sql);
            psmt.setString(1,uid);
            psmt.setString(2,upass);
            rs = psmt.executeQuery(); //쿼리문 실행

            if(rs.next()){
                //쿼리 결과를 DTO 저장한 뒤 반환
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegdate(rs.getString("regdate"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return dto;
    }


}
