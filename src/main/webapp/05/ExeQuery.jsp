<%@ page import="com.common.JDBConnect" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원 목록 조회 테스트</title>
</head>
<body>
    <%
        //DB 연결
        DBConnPool conn = new DBConnPool();

        //쿼리문 작성
        String sql = "SELECT * FROM member ";
        Statement stmt = conn.con.createStatement();

        //쿼리 실행
        ResultSet rs = stmt.executeQuery(sql);

        //결과 확인
        while (rs.next()){
            String id = rs.getString(1);
            String pwd = rs.getString(2);
            String name = rs.getString("name");
            Date regDate = rs.getDate(4);

            out.print(String.format("%s %s %s %s", id,pwd,name,regDate) +" <br/>");


        }

        conn.close();

    %>
</body>
</html>
