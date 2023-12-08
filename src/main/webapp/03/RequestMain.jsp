<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<%
    request.setAttribute("reqStr" , "request영역의 문자열");
    request.setAttribute("reqPerson" , new Person("안중근", 30));
%>
<head>
    <title>request 영역</title>
</head>
<body>
    <h2>request 영역 속성값 삭제하기</h2>
    <%
        /*request.removeAttribute("reqStr");*/
        request.removeAttribute("reqInt"); //존재하지 않는 값 삭제
    %>

    <h2>request 영역 속성값 읽기</h2>
    <%
        Person reqPerson = (Person) request.getAttribute("reqPerson");

    %>
    <ul>
        <li>String 객체 : <%=request.getAttribute("reqStr")%></li>
        <li>Person 객체 : <%=reqPerson.getName()%></li>
    </ul>

    <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
    <%
        request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
                .forward(request,response);
    %>
</body>
</html>
