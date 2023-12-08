<%@ page import="com.model1.BoardDTO" %>
<%@ page import="com.model1.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="IsLoggedIn.jsp"%>
<%
    String num = request.getParameter("num");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO dto = new BoardDTO();
    dto.setTitle(title);
    dto.setNum(num);
    dto.setContent(content);

    BoardDAO dao = new BoardDAO();
    int affected = dao.updateEdit(dto);
    dao.close();

    if(affected ==1){
        //성공 시 상세 보기 페이지로 이동
        response.sendRedirect("View.jsp?num=" + dto.getNum());
    }else{
        JSFunction.alertBack("수정에 실패했습니다.", out);
    }
%>
