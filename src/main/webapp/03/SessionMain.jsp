<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <%
        ArrayList<String> lists = new ArrayList<>();
        lists.add("리스트");
        lists.add("컬렉션");

        session.setAttribute("lists" , lists);
    %>
</head>
<body>
    <%--
        session 객체는 클라이언트가 브라우저를 닫을 때 까지 공유 가능
        세션은 클라이언트가 서버에 접속해 있는 상태 혹은 단위를 뜻함

    --%>
    <h2>페이지 이동 후 session 영역의 속성 읽기</h2>
    <a href="SessionLocation.jsp">SessionLocation 바로가기</a>


</body>
</html>
