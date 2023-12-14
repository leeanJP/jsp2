<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <script>
        function validateForm(form){
            if(!form.pass.value){
                alert("비밀번호를 입력 하세요");
                return false;
            }
        }
    </script>
</head>
<body>
    <h2>파일 첨부형 게시판 - 비밀번호 검증</h2>
    <form name="writeFrm" method="post" action="/mvcboard/pass.do" onsubmit="return validateForm(this);">
        <input type="hidden" name="idx" value="${param.idx}">
        <input type="hidden" name="mode" value="${param.mode}">
        <table border="1" width="90%">
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pass" style="width: 100px;"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit">검증</button>
                    <button type="reset">RESET</button>
                    <button type="button" onclick="location.href='../mvcboard/list.do';">목록</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
