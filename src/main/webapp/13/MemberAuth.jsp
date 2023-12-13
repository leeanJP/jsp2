<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원 인증</title>
</head>
<body>
    <h2>MVC 패턴으로 회원 인증</h2>
    <p>
        <strong>${authMsg}</strong>
        <br/>
        <a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
        &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=must&pass=1234">회원인증(회원)</a>
        &nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
        &nbsp;&nbsp;
    </p>
</body>
</html>
