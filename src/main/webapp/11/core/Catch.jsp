<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSTL - catch</title>
</head>
<body>
    <h4>자바 코드 예외</h4>
    <%
        int num1= 100;

    %>

    <c:catch var="eMsg">
        <%
            int result = num1/0;
        %>

    </c:catch>
    예외 내용 : ${eMsg}

    <h4>EL 에서의 예외</h4>
    <c:set var="num2" value="200"></c:set>
    <c:catch var="eMsg">
        ${"일" + num2}
    </c:catch>
    예외 내용 : ${eMsg}




</body>
</html>
