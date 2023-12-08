<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%--
    <%@ %> >> 지시어(Directive)
    JSP 페이지를 자바 코드로 변환하는데 필요한 정보들을 담고 있고 JSP 엔진에 알려주는 역할
    언어, 인코딩
    -기본 문법
    <%@ 지시어 속성1="값" 속성2="값"%>
    -지시어 종류
    page

     >> JSP 페이지에 대한 설정
     language >> 기본값은 java
     content type >> 기본값  text/html 그 외 text/xml text/plain
     charset >> ISO-8859-1 한글 사용할때에는 UTF-8

    import 속성
    >> 자바에서 외부 클래스 사용할 때 import 해주는 것처럼
       jsp 에서도 필요한 클래스를 import 해서 사용함

    errorPage isErrorPage 속성
     에러를 처리하는 방법
       1. try / catch 문으로 직접 에러를 처리하는 방법.
       2. errorPage isErrorPage 속성을 이용해서 적용된 페이지로 이동

    include

    tablib

--%>
<%!
    //선언부 기본형태
    String str1 = "JSP";
    String str2 = "안녕하세요";
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1> 처음 만들어보는 <%= str1 %>  <%--표현식--%>
</h1>
<p>
    <jsp:include page="/common/Link.jsp"></jsp:include>
    <%    /*스크립틀릿 */
        out.println(str2 + str1 + "입니다.");

        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
    %>
    <br/>
    <%
        out.println("오늘은 <br/>" + todayStr  + " 입니다.");

    %>

</p>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<li>세션 유지 시간 : <%= session.getMaxInactiveInterval()%></li>
</body>
</html>