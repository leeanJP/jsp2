<%@ page import="com.util.JSFunction" %>
<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>


<%
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");
    String saveCheck = request.getParameter("save_check");

    if(saveCheck != null && saveCheck.equals("Y")){
        CookieManager.makeCookie(response, "loginId", user_id, 86400);
    }else {
        CookieManager.deleteCookie(response, "loginId");
    }
    if("must".equals(user_id) && "1234".equals(user_pw)){
        JSFunction.alertLocation("로그인 성공" , "IdSaveMain.jsp", out );
    }else {
        JSFunction.alertBack("로그인 실패" , out);
    }

%>