<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%------------------------------------------------------------------------------------------%>
<%-- TAG LIBRARY IMPORT --%>
<%------------------------------------------------------------------------------------------%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%------------------------------------------------------------------------------------------%>
<%-- JAVA GLOBAL VALUES USING FRONTEND --%>
<%------------------------------------------------------------------------------------------%>
<%
    //글로벌 변수
    String _APP_NAME = "sample template title";

    request.setAttribute("ts", (new java.util.Date()).getTime());
    request.setAttribute("_APP_NAME", _APP_NAME);
%>