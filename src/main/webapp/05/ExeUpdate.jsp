<%@ page import="com.common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JDBC</title>

</head>
<body>
    <h2>회원 추가 테스트</h2>
    <%
        //DB 연결
        DBConnPool conn = new DBConnPool();

        String id = "jp1";
        String pwd = "1234";
        String name = "이재필";

        //쿼리문 생성
        String sql = "INSERT INTO member VALUES (?,?,?, sysdate)";

        PreparedStatement psmt = conn.con.prepareStatement(sql);
        psmt.setString(1,id);
        psmt.setString(2,pwd);
        psmt.setString(3,name);

        //쿼리 실행
        int result = psmt.executeUpdate();
        out.print(result + "행이 추가 되었습니다.");

        //연결 종료
        conn.close();



    %>


</body>
</html>
