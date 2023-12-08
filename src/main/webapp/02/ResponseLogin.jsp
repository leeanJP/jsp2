<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String id = request.getParameter("user_id");
        String pwd = request.getParameter("user_pwd");

        if(id.equalsIgnoreCase("must") && pwd.equals("1234")){
            response.sendRedirect("ResponseWelcome.jsp");
        }else {
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request,response);

        }
    %>
</body>
</html>
