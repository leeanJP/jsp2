<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>액션태그 useBean</title>
</head>
<body>
    <h2>액션 태그로 폼값 한번에 받기</h2>
    <jsp:useBean id="person" class="com.common.Person"/>
    <jsp:setProperty name="person" property="*"/>

    <h2>getProperty 액션 태그로 자바빈즈 속성 가져오기</h2>
    <ul>
        <li>이름 : <jsp:getProperty name="person" property="name"/></li>
        <li>이름 : <jsp:getProperty name="person" property="age"/></li>
    </ul>


</body>
</html>
