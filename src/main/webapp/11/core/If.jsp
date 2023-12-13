<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>JSTL - If</title>
</head>
<body>
    <%--변수 선언--%>
    <c:set var="number" value="100"></c:set>
    <c:set var="string" value="JSP"/>

    <h4>JSTL if 태그로 홀짝 판단하기</h4>
    <c:if test="${number % 2 == 0}" var="result">
        ${number} 는 짝수입니다. <br/>
    </c:if>

    <c:if test="${string == 'Java'}" var="result2">
        문자열은 Java 입니다.<br/>
    </c:if>
    <c:if test="${string != 'Java'}" var="result2">
        문자열은 Java 가 아닙니다.<br/>
    </c:if>

    <h2>조건문 주의사항</h2>
    <c:if test="100" var="result3">
        EL이 아닌 정수 지정하면 false
    </c:if>
    result3 : ${result3}<br/>
    <c:if test="tRuE" var="result4">
        대소문자 구분없이 true인 경우 true 리턴 <br/>
    </c:if>
    result4 : ${result4}<br/>

    <c:if test=" ${ true } " var="result5">
        EL 양쪽에 빈 공백이 있는 경우 false <br/>
    </c:if>
    result5 : ${result5}<br/>


</body>
</html>
