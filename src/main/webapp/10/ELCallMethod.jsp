<%@ page import="com.el.MyElClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld"%>
<%
    MyElClass myClass = new MyElClass();// 객체 생성
    pageContext.setAttribute("myClass", myClass);
%>
<html>
<head>
    <title>EL - 메소드 호출</title>
</head>
<body>
    <h2>영역에 저장 후 메서드 호출</h2>
    001225-3000000 => ${myClass.getGender("001225-3000000")}<br/>
    001225-4000000 => ${myClass.getGender("001225-4000000")}<br/>

    <h3>클래스명을 통해 정적 메서드 호출하기</h3>
    ${MyElClass.showGugudan(5)}

    <h2>TLD 파일을 사용해 정적메소드 호출하기</h2>
    <li>mytag:isNumber("100") => ${mytag:isNumber("100")}</li>
    <li>mytag:isNumber("이백") => ${mytag:isNumber("이백")}</li>

</body>
</html>
