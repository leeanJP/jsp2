<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<%--포매팅 태그는 국가별로 언어 날짜 시간 숫자 형식 설정하는 태그--%>

<head>
    <title>JSTL - fmt 1 </title>
</head>
<body>
    <h4>숫자 포맷 설정</h4>
    <c:set var="num1" value="12345"></c:set>
    콤마 O : <fmt:formatNumber value="${num1}"/><br/>
    콤마 X : <fmt:formatNumber value="${num1}" groupingUsed="false"/><br/>
    <fmt:formatNumber value="${num1}" type="currency" var="printNum1"/>
    통화기호 : ${printNum1}<br/>
    <fmt:formatNumber var="printNum2" type="percent" value="0.03"/>
    퍼센트 : ${printNum2}<br/>

    <h4>문자열을 숫자로 변경</h4>
    <c:set var="num2" value="6,789.01"/>
    <fmt:parseNumber value="${num2}" pattern="00,000.00" var="printNum3"></fmt:parseNumber>
    소수점까지 : ${printNum3} <br/>
    <fmt:parseNumber value="${num2}" integerOnly="true" var="printNum4"></fmt:parseNumber>
    정수만 : ${printNum4} <br/>


    <h4>날짜 포맷</h4>
    <c:set var="today" value="<%=new Date()%>"/>
    full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/> <br/>
    short : <fmt:formatDate value="${today}" type="date" dateStyle="short"/> <br/>
    long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/> <br/>
    default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/> <br/>
    <h4>시간 포맷</h4>
    full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/> <br/>
    short : <fmt:formatDate value="${today}" type="time" timeStyle="short"/> <br/>
    long : <fmt:formatDate value="${today}" type="time" timeStyle="long"/> <br/>
    default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/> <br/>

    <h4>날짜 시간 표시</h4>
    <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> <br/>
    <fmt:formatDate value="${today}" type="both" pattern="YYYY-MM-dd hh:mm:ss"/> <br/>

    <h4>타임존 설정</h4>
    <fmt:timeZone value="GMT">
        <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> <br/>
    </fmt:timeZone>

    <fmt:timeZone value="America/Chicago">
        <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> <br/>
    </fmt:timeZone>

    <h4>로케일 설정</h4>
    한글로 설정 : <fmt:setLocale value="ko_kr"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}"/> <br/>

    일어로 설정 : <fmt:setLocale value="ja_JP"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}"/> <br/>

    영어로 설정 : <fmt:setLocale value="en_US"/>
    <fmt:formatNumber value="10000" type="currency"/> /
    <fmt:formatDate value="${today}"/> <br/>

</body>
</html>
