<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>페이지 이동 후 세션 영역의 속성 값 읽기</h2>
    <%
        ArrayList<String> lists = (ArrayList<String>) session.getAttribute("lists");
        for(String str : lists){
            out.print(str +"<br>");
        }
    %>
</body>
</html>
