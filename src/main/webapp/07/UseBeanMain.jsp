<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>액션 태그 - UseBean</title>
</head>
<body>
  <h2>액션태그 useBean</h2>
  <h3>자바빈즈 생성하기</h3>
  <jsp:useBean id="person" class="com.common.Person" scope="request"/>

  <%--
    useBean 내부 동작
    Person person = (Person)request.getAttribute("person");
    if(person ==null){
      person = new Person();
      request.setAttribute("person");
    }
  --%>

  <h2>setProperty 액션 태그로 자바빈즈 속성 지정하기</h2>
  <jsp:setProperty name="person" property="name" value="이재필"></jsp:setProperty>
  <jsp:setProperty name="person" property="age" value="20"></jsp:setProperty>

  <h2>getProperty 액션 태그로 자바빈즈 속성 가져오기</h2>
  <ul>
    <li>이름 : <jsp:getProperty name="person" property="name"/></li>
    <li>이름 : <jsp:getProperty name="person" property="age"/></li>
  </ul>

</body>
</html>
