<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--변수 선언--%>
<c:set var="scopeVar" value="Page Value"/>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>


<html>
<head>
    <title>JSTL remove</title>
</head>
<body>
    <h4>출력하기</h4>
    <ul>
        <li>scopeVar: ${scopeVar}</li>
        <li>request scopeVar: ${requestScope.scopeVar}</li>
        <li>session scopeVar: ${sessionScope.scopeVar}</li>
        <li>application scopeVar: ${applicationScope.scopeVar}</li>
    </ul>

    <h2>session 영역에서 삭제</h2>
    <c:remove var="scopeVar" scope="session"/>
    <ul>
        <li>scopeVar: ${scopeVar}</li>
        <li>request scopeVar: ${requestScope.scopeVar}</li>
        <li>session scopeVar: ${sessionScope.scopeVar}</li>
        <li>application scopeVar: ${applicationScope.scopeVar}</li>
    </ul>
    <c:remove var="scopeVar"/>

    <ul>
        <li>scopeVar: ${scopeVar}</li>
        <li>request scopeVar: ${requestScope.scopeVar}</li>
        <li>session scopeVar: ${sessionScope.scopeVar}</li>
        <li>application scopeVar: ${applicationScope.scopeVar}</li>
    </ul>
</body>
</html>
