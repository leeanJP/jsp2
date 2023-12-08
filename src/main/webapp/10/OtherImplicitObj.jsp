<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    CookieManager.makeCookie(response, "ELCookie" , "EL", 10);
%>
<html>
<head>
    <title>EL - 그 외 내장객체</title>
</head>
<body>
    <h3>쿠키 값 읽기</h3>
    <li>EL Cookie 값 : ${cookie.ELCookie.value}</li>

    <h3>HTTP 헤더 값 읽기</h3>
    <ul>
        <li>host : ${header.host}</li>
        <li>user-agent : ${header['user-agent']}</li>
        <li>cookie : ${header.cookie}</li>
    </ul>

    <h3>컨텍스트 초기화 매개변수 읽기</h3>
    <li>OracleDriver : ${initParam.OracleDriver}</li>

    <h3>컨텍스트 루트 경로</h3>
    <li>${pageContext.request.contextPath}</li>
</body>
</html>
