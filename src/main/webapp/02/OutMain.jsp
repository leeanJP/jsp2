<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%--
        out 내장객체
        브라우저에 출력할 때 사용
        <%= %>표현식으로 출력하는 경우가 편해서 out내장객체를 많이 사용 X

    --%>
    <title>Title</title>
    <%
        out.print("출력되지 않는 텍스트");
        out.clearBuffer();   //버퍼를 비워줌

        out.print("<h2>out 내장 객체</h2>");
        //버퍼 크기정보 확인
        out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
        out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");

        out.flush(); // 버퍼 내용 출력
        /*현재 버퍼에 저장되어 있는 내용을 클라이언트로 전송하고 버퍼를 비워준다.
        *   버퍼는 원래 모두 채워졌을 때 플러쉬 되면서 내용을 출력하는데
        *   필요할 때에는 이렇게 즉시 출력할 수 있다.
        * */

        out.print("flush 후  버퍼의 크기 : " + out.getRemaining() + "<br>");

        //다양한 값 출력
        out.print(1);
        out.println(false);
        out.println('가');


    %>


</head>
<body>
</body>
</html>
