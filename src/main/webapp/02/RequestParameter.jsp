<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Request 파라메터</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String sex = request.getParameter("sex");
        String[] favo = request.getParameterValues("favo");
        String favoStr = "";
        if(favo != null){
            for(String temp : favo){
                favoStr += temp;
            }
        }
        String intro = request.getParameter("intro").replace("\r\n", "<br/>");
        out.print(request.getParameter("intro"));
    %>

    <ul>
        <li>아이디 : <%=id%> </li>
        <li>성별 :  <%=sex%></li>
        <li>관심사 : <%=favoStr%></li>
        <li>자기소개 : <%=intro%> </li>

    </ul>

</body>
</html>
