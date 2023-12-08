<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Outer Page</title>
</head>
<body>
  <h2>외부 파일 2</h2>
  <%
    String newVar2 = "백제 온조왕";

  %>

  <ul>
    <li>page 영역 속성 : <%=pageContext.getAttribute("pAttr")%></li>
    <li>request 영역 속성 :<%=request.getAttribute("rAttr")%> </li>
  </ul>
</body>
</html>
