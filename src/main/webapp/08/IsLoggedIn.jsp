<%@ page import="com.util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    if(session.getAttribute("UserId") == null){
        JSFunction.alertLocation("로그인 후 글작성 가능함" , "../06/LoginForm.jsp",out);
        return;
    }
%>