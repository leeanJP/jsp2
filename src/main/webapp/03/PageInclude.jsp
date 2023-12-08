<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h4>Include 페이지</h4>
<%
    int pInt2 = (Integer)pageContext.getAttribute("pageInt");
    String pStr2 = pageContext.getAttribute("pageStr").toString();
    Person person2 = (Person) pageContext.getAttribute("pagePerson");
%>

<ul>
    <li>Integer 객체 : <%= pInt2 %></li>
    <li>String 객체 : <%= pStr2 %></li>
    <li>Person 객체 : <%= (person2).getName() %> , <%= (person2).getAge()%></li>
</ul>