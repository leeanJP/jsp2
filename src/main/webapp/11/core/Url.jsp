<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSTL Url</title>
</head>
<body>
    <c:set var="requestVar" value="MustHave" scope="request"/>
    <c:url value="OtherPage.jsp" var="url">
        <c:param name="user_param1" value="출판사"/>
        <c:param name="user_param2">골든레빗</c:param>
    </c:url>
    <a href="${url}">OtherPage.jsp</a>
</body>
</html>
