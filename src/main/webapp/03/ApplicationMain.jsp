<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>application 영역</title>
</head>
<body>
    <%--
        웹 애플리케이션 하나의 application 객체 생성
        모든 요청들은 application 객체를 공유한다.
        서버를 닫기 전까지는 계속 유지가 되고

    --%>
    <%
        Map<String, Person> maps = new HashMap<>();
        maps.put("person1", new Person("페이커", 27));
        maps.put("person2", new Person("케리아", 22));
        application.setAttribute("maps" , maps);
    %>
    application 영역에 속성이 저장되었습니다.
</body>
</html>
