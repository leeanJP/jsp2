<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>내장 객체 - Exception</title>
</head>
<body>
    <%-- errorPage isErrorPage
        웹 개발에서 가장 많이 보는 에러 404 500 405

    --%>

    <%
        int status = response.getStatus();// response 내장객체에서 에러 코드 확인
        System.out.println(status);

        if(status ==404){
            out.print("404에러 발생");
            out.print("<br/> 파일 경로를 확인하세요" );
        }else if(status ==405){
            out.print("405에러 발생");
            out.print("<br/> 요청 방식을 확인하세요" );
        }else if(status ==500){
            out.print("500에러 발생");
            out.print("<br/> 소스코드를 확인하세요" );
        }


    %>
</body>
</html>
