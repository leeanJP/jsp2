<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Hello Servlet</title>
</head>
<body>
    <h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
    <p>
        <strong><%=request.getAttribute("msg")%></strong>
        <br/>
        <a href="./HelloServlet.do">바로가기</a>
    </p>
</body>
</html>
