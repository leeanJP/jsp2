<%@ page import="com.model1.BoardDTO" %>
<%@ page import="com.model1.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>

<%
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setId(session.getAttribute("UserId").toString());

    BoardDAO dao = new BoardDAO();
    int iResult = dao.insertWrite(dto);
    dao.close();

    if(iResult == 1){ //성공
        response.sendRedirect("List.jsp");
    }else { //실패
        JSFunction.alertBack("글쓰기 실패!" , out);
    }

%>