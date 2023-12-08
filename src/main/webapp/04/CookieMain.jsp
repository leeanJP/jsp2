<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>1. 쿠키 설정</h2>
  <%
    Cookie cookie = new Cookie("myCookie", "내가만든쿠키"); //쿠키 생성
    cookie.setPath(request.getContextPath()); //최상위 경로로 설정
    cookie.setMaxAge(3600); //유지시간 1시간
    response.addCookie(cookie); //response 헤더에 쿠키 추가

  %>

  <h2>2. 쿠키 설정 직후 쿠키 확인</h2>
  <%
    Cookie[] cookies = request.getCookies(); //request 헤더에서 모든 쿠키 가져오기
    if(cookies != null){
      for(Cookie c : cookies){
        String cName = c.getName();
        String cValue = c.getValue();

        out.print(String.format("%s : %s <br/>", cName, cValue));
      }
    }

  %>
  <h2>3. 페이지 이동 후 쿠키값 읽어오기</h2>
  <a href="CookieReuslt.jsp">
    다음 페이지에서 쿠키 값 확인하기
  </a>

</body>
</html>
