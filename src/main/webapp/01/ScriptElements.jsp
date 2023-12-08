<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%!  //선언부 (메서드 선언)
    //선언부에서는 스크립틀릿, 표현식에서 사용할 변수나 메서드를 선언함
    // _jspService() 외부에 선언
    public int add(int num1, int num2){
        return num1+num2;
    }
%>
<html>
<head>
    <title>스크립트 요소</title>
</head>
<body>
    <%--
        JSP 실행될 때 서블릿(Java Code)으로 변환되고 클래스로 컴파일되서 응답하게 된다.
        이 변환과정에서 _jspService() 메서드가 생성
        선언부, 스크립틀릿, 표현식

    --%>
    <% //스크립틀릿
        //jsp 페이지가 요청을 받을 때 실행되야할 자바 코드들이 작성되는 공간
        // _jspService() 메서드 내부에 위치함
        //선언부에서 선언한 메소드를 호출함
        int result = add(1,2);
    %>

    <%--
    //표현식
    //실행 결과로 하나의 값이 남는 문장
    --%>

    덧셈 결과 : <%= result%> <br/>
    덧셈 결과 : <%= add(10,20)%>
</body>
</html>
