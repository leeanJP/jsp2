<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>page 이동 후 page 영역의 속성 값 읽기</title>
</head>
<body>
    <%
        Object pInt = pageContext.getAttribute("pageInt");
        Object pStr = pageContext.getAttribute("pageStr");
        Object pPer = pageContext.getAttribute("pagePerson ");
    %>

    <ul>
        <li>Integer 객체 : <%= (pInt ==null) ? "값 없음" : pInt %></li>
        <li>String 객체 : <%= (pStr ==null) ? "값 없음" : pStr %></li>
        <li>Person 객체 : <%= (pPer ==null) ? "값 없음" : ((Person)pPer).getName() %></li>
    </ul>
</body>
</html>
