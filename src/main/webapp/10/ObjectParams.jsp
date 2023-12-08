<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>EL - 객체 매개변수 전달</title>
</head>
<body>
    <%
        request.setAttribute("personObj" , new Person("홍길동", 100));
        request.setAttribute("StringObj", "문자열");
        request.setAttribute("IntegerObj", new Integer(50));
    %>

    <jsp:forward page="ObjectResult.jsp">
        <jsp:param name="firstNum" value="10"/>
        <jsp:param name="secondNum" value="20"/>
    </jsp:forward>
</body>
</html>
