<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>error 발생 시 처리 페이지</title>
</head>
<body>
    <h2> 서비스 중 일시적인 오류가 발생했습니다.</h2>
    <p>
        오류명 : <%= exception.getClass().getName()%> <br/>
        오류 메세지 : <%= exception.getMessage()%> 
    </p>
</body>
</html>
