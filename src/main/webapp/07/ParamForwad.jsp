<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>액션 태그 - param</title>
</head>
<body>
    <jsp:useBean id="person" class="com.common.Person" scope="request"></jsp:useBean>
    <h2>포워드 된 페이지에서 매개변수 확인</h2>
    <ul>
        <li><jsp:getProperty name="person" property="name"/></li>
        <li>나이 <jsp:getProperty name="person" property="age"/></li>
        <li>본명 :<%=request.getParameter("param1")%></li>
        <li>출생 :<%=request.getParameter("param2")%></li>
        <li>특징 :<%=request.getParameter("param3")%></li>
    </ul>

    <jsp:include page="ParamInclude.jsp">
        <jsp:param name="loc1" value="제주도"></jsp:param>
        <jsp:param name="loc2" value="탐라국"></jsp:param>
    </jsp:include>
</body>
</html>
