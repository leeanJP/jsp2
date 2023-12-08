<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
    <%
        LocalDate today = LocalDate.now(); // 오늘 날짜
        LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);//내일 날짜
    %>
</html>
