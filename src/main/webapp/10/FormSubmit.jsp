<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>EL -폼 값 처리</title>
</head>
<body>
  <h2>폼 값 전송하기</h2>
  <form action="FormResult.jsp" method="post" name="frm">
    이름 : <input type="text" name="name">
    성별 : <input type="radio" name="gender" value="Man">남자
          <input type="radio" name="gender" value="Woman">여자
          <br/>
    학력 : <select name="grade">
            <option value="ele">초딩</option>
            <option value="mid">중딩</option>
            <option value="high">고딩</option>
            <option value="uni">대딩</option>
          </select>
    관심사 : <input type="checkbox" name="inter" value="pol">정치
            <input type="checkbox" name="inter" value="eco">경제
            <input type="checkbox" name="inter" value="ent">연예
            <input type="checkbox" name="inter" value="spo">운동
    <input type="submit" value="전송">
  </form>
</body>
</html>
