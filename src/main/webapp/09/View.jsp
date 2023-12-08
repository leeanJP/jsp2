<%@ page import="com.model1.BoardDAO" %>
<%@ page import="com.model1.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  String num = request.getParameter("num");
  BoardDAO dao = new BoardDAO();
  dao.updateViewCount(num);
  BoardDTO dto = dao.selectView(num);
  dao.close();

%>
<html>
<head>
    <title>회원제 게시판</title>
</head>
<body>
  <script>
    function deletePost(){
      var confirmed = confirm("진짜 삭제할꺼임?");
      if(confirmed){
        var form = document.writeFrm;
        form.method = "post";
        form.action = "DeleteProcess.jsp";
        form.submit();
      }
    }
  </script>
  <jsp:include page="../common/Link.jsp"></jsp:include>
  <h2>회원제 게시판- 상세 보기</h2>
  <form name="writeFrm">
    <input type="hidden" name="num" value="<%=num%>">
    <table border="1" width="90%">
      <tr>
        <td>번호</td>
        <td><%=dto.getNum()%></td>
        <td>작성자</td>
        <td><%=dto.getName()%></td>
      </tr>
      <tr>
        <td>작성일</td>
        <td><%=dto.getPostdate()%></td>
        <td>조회수</td>
        <td><%=dto.getVisitcount()%></td>
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="3"><%=dto.getTitle()%></td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="3"><%=dto.getContent()%></td>
      </tr>
      <tr>
        <td colspan="4" align="center">
          <%
            if(session.getAttribute("UserId") !=null &&
                session.getAttribute("UserId").toString()
                        .equals(dto.getId())){

          %>
            <button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">수정</button>
            <button type="button" onclick="deletePost();">삭제</button>

          <%
            }
          %>
<%--          <%--%>
<%--            if(session.getAttribute("UserId") !=null &&--%>
<%--                    session.getAttribute("UserId").toString()--%>
<%--                            .equals(dto.getId())){--%>

<%--          %>--%>

<%--          <%--%>
<%--            }--%>
<%--          %>--%>
          <button type="button" onclick="location.href='List.jsp';">목록</button>
        </td>
      </tr>
    </table>

  </form>
</body>
</html>
