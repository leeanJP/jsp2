<%@ page import="com.model1.BoardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.model1.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //DAO 생성
    BoardDAO dao = new BoardDAO();

    //사용자 검색 조건 입력
    Map<String, Object> param = new HashMap<>();
    String searchFiled = request.getParameter("searchFiled");
    String searchWord =  request.getParameter("searchWord");
    if(searchWord !=null){
        param.put("searchFiled", searchFiled);
        param.put("searchWord", searchWord);
    }
    int totalCount = dao.selectCount(param); //게시물 수 확인
    List<BoardDTO> boardList = dao.selectList(param); //게시물 목록
    dao.close();

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
    <jsp:include page="../common/Link.jsp"></jsp:include>
    <h2>목록 보기</h2>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchFiled">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>

    <%--게시물 목록 테이블 --%>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>

        <%
            //게시물이 하나도 없을때
            if(boardList.isEmpty()){

        %>
                <tr>
                    <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
                </tr>

        <%
            //게시물이 있을 때
            }else{
                int virtualNum = 0; //화면상에서 게시물 번호
                for(BoardDTO dto : boardList){
                    virtualNum = totalCount--;
        %>
                    <tr align="center">
                        <td><%= virtualNum%></td> <%--게시물 번호--%>
                        <td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td> <%--제목--%>
                        <td align="center"><%=dto.getId()%></td>            <%--작성자 아이디--%>
                        <td align="center"><%=dto.getVisitcount()%></td>    <%--조회수--%>
                        <td align="center"><%=dto.getPostdate()%></td>      <%--작성일--%>
                    </tr>
        <%
                }
            }
        %>
    </table>

    <table border="1" width="90%">
        <tr align="right">
            <td>
                <button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
            </td>
        </tr>
    </table>

</body>
</html>
