<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<%--
  지금까지 JSP에서 변수 값 출력할 때 <%=%>
  EL (Expression Language) 변수 값 출력할 때 사용
  ${속성}
  특정영역에 저장한 변수인 경우에
  ${영역.변수명}
  JSP 스크립트 요소에서는 사용 불가능 (스크립틀릿 표현식 선언부)

  ${param.name}
  ${param['name']}
  ${param["name"]}
  ${header["user-agent"]}
  ${header.user-agent} // 사용 불가능
--%>

<%
  pageContext.setAttribute("scopeValue", "페이지 영역");
  request.setAttribute("scopeValue", "리퀘스트 영역");
  session.setAttribute("scopeValue", "세션 영역");
  application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<html>
<head>
    <title>EL - 내장 객체</title>
</head>
<body>
  <h2>Implicit Obj Main 페이지</h2>
  <ul>
    <li>페이지 영역 : ${pageScope.scopeValue}</li>
    <li>리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li>세션 영역 : ${sessionScope.scopeValue}</li>
    <li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
  </ul>

  <h3>영역 지정 없이 속성 출력</h3>
  <ul>
    <li>${scopeValue}</li>
  </ul>

  <jsp:forward page="ImplicitForward.jsp"></jsp:forward>
</body>
</html>
