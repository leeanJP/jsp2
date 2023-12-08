<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String pVal = "방랑시인";

%>
<html>
<head>
    <title>액션 태그 - param</title>
</head>
<body>
<jsp:useBean id="person" class="com.common.Person" scope="request"/>
<jsp:setProperty name="person" property="name" value="홍길동"></jsp:setProperty>
<jsp:setProperty name="person" property="age" value="520"></jsp:setProperty>
<jsp:forward page="ParamForwad.jsp?param1=홍길동동">
    <jsp:param name="param2" value="경기도"/>
    <jsp:param name="param3" value="<%=pVal%>"/>
</jsp:forward>

</body>
</html>
