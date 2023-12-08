<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String outerPath1 = "./OuterPage1.jsp";
    String outerPath2 = "./OuterPage2.jsp";

    pageContext.setAttribute("pAttr", "동명왕");
    request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
    <title>지시어와 액션태그 동작 방식</title>

    <%--지시어로 인클루드--%>
    <h2>지시어로 페이지 포함하기</h2>
    <%@include file="OuterPage1.jsp"%>
    <%--<%@include file="<%=outerPath1%>"%> //인클루드 지시어에서는 표현식 사용 X--%>
    <p>외부 파일에 선언한 변수 : <%=newVar1%></p>


    <%--액션태그로 인클루드--%>
    <h2>액션태그로 페이지 포함하기</h2>
    <jsp:include page="OuterPage2.jsp"></jsp:include>
    <jsp:include page="<%=outerPath2%>"/>
    <p>외부 파일에 선언한 변수 : <%--<%=newVar2%>--%></p>
    //외부 파일에 선언한 변수는 못가져옴

</head>
<body>

</body>
</html>
