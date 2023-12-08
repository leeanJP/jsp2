<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>3.요청 헤더 정보 출력하기</h2>
    <%
        Enumeration headers = request.getHeaderNames();
        while (headers.hasMoreElements()){
            String headerName = (String)headers.nextElement();
            String headerValue = request.getHeader(headerName);

            out.print("헤더명 : " + headerName + ", 헤더 값 : " + headerValue +"<br/>");
        }
    %>



</body>
</html>
