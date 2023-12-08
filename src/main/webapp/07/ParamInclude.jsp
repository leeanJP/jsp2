<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<body>
    <h2>인클루드 된 페이지에서 매개변수 확인</h2>
    <ul>
        <li><%=request.getParameter("loc1")%></li>
        <li><%=request.getParameter("loc2")%></li>
    </ul>
</body>
</html>
