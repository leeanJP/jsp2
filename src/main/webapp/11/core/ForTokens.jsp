<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>JSTL -forTokens</title>
</head>
<body>
  <h2>JSTL forTokens 태그 사용</h2>
  <%
    String rgba = "Red,Green,Black,Blue";
    String num = "010-2588-8588";
  %>
  <c:forTokens items="<%=rgba%>" delims="," var="c">
    <span style="color:${c}";>${c}</span>
  </c:forTokens>
</body>
</html>
