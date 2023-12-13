<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>어노테이션으로 매핑후 Servlet 에서 직접 출력하기</h2>

    <form method="post" action="<%=request.getContextPath()%>/13/DirectServletPrint.do">
        <input type="submit" value="바로가기">
    </form>
</body>
</html>
