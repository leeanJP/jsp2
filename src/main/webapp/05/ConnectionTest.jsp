<%@ page import="com.common.JDBConnect" %>
<%@ page import="com.common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JDBC 테스트</title>
    <%--
        요청이 있을때마다 DB connection을 새로 연결하고 해제하면 시간이 많이걸림

        커넥션 풀 Connection pool
        Connection을 미리 생성해 두고 필요할때 가져다쓰고 완료되면 반납하는 형식




    --%>
</head>
<body>
<%--    <h2>JDBC 연결 테스트 01</h2>--%>
<%--    <%--%>
<%--        JDBConnect jdbc1 = new JDBConnect();--%>

<%--        jdbc1.close();--%>
<%--    %>--%>

<%--    <h2>JDBC 연결 테스트 02</h2>--%>
<%--    <%--%>
<%--        String driver = application.getInitParameter("OracleDriver");--%>
<%--        String url = application.getInitParameter("OracleURL");--%>
<%--        String id = application.getInitParameter("OracleId");--%>
<%--        String pwd = application.getInitParameter("OraclePwd");--%>


<%--        JDBConnect jdbc2 = new JDBConnect(driver,url,id,pwd);--%>

<%--        jdbc2.close();--%>
<%--    %>--%>

<%--    <h2>JDBC 연결 테스트 03</h2>--%>
<%--    <%--%>
<%--        JDBConnect jdbc3 = new JDBConnect(application);--%>

<%--        jdbc3.close();--%>
<%--    %>--%>

    <h2>커넥션풀 연결 테스트 01</h2>
    <%
        DBConnPool pool = new DBConnPool();

        pool.close();
    %>
</body>
</html>
