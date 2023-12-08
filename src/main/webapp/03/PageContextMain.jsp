<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    //속성 저장
    pageContext.setAttribute("pageInt" ,1000);
    pageContext.setAttribute("pageStr" ,"페이지 영역 문자열");
    pageContext.setAttribute("pagePerson" ,new Person("이순신", 100));

%>
<html>
<head>
    <title>page 영역</title>

    <h2>page 영역의 속성값 읽기</h2>
    <%
        int pInt = (Integer)pageContext.getAttribute("pageInt");
        String pStr = pageContext.getAttribute("pageStr").toString();
        Person person = (Person) pageContext.getAttribute("pagePerson");

    %>

    <ul>
        <li><%=pInt%></li>
        <li><%=pStr%></li>
        <li><%=person.getName()%> , <%= person.getAge()%></li>

    </ul>

    <h2>include  된 파일에서 page 영역 읽기</h2>
    <%@include file="PageInclude.jsp"%>

    <h2>페이지 이동 후 page 영역 읽기</h2>
    <a href="PageLocation.jsp">PageLocation 바로가기</a>




</head>
<body>

</body>
</html>
