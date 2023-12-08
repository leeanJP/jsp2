<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>내장 객체 application</title>
</head>
<body>
    <%--
        웹 애플리케이션 당 하나만 생성
        모든 JSP 페이지에서 접근이 가능함
        SevletContext 타입

        보통 웹애플리케이션 전체에서 사용되는 정보를 저장하거나 서버 정보
        서버 물리적경로 가져오는데 사용함
    --%>

    <h2>web.xml에 설정한 내용 읽어 오기</h2>
    초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM")%>

    <h2>서버 물리적 경로 가져오기</h2>
    application 내장 객체 : <%= application.getRealPath("/02")%>

    <h2>선언부에서 내장객체 사용하기</h2>
    <%!
        public String useImplictObject() {
            return this.getServletContext().getRealPath("/02");
        }

        public String useImplictObject(ServletContext app){
            return app.getRealPath("/02");
        }
    %>
    <ul>
        <li>this 사용 : <%=useImplictObject()%></li>
        <li>내장객체를 파라메터로 전달 : <%=useImplictObject(application)%></li>
    </ul>

</body>
</html>
