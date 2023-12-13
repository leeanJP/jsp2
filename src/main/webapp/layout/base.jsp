<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/global.jsp"%>

<!DOCTYPE html>
<html lang="ko" data-layout="vertical" data-topbar="light"
      data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">
<head>
    <title><%= _APP_NAME %></title>
    <meta charset="utf-8">
    <%--메타정보, favicon css 파일 등 프로젝트 전역에 필요한 파일 및 정보 세팅--%>
    <link href="<c:url value=""/>" type="text/css" rel="stylesheet" />

</head>
<body id="base">
<%--global JS --%>

<div id="layout-wrapper">
    <%--개별 화면 템플릿 양식--%>
    <div class="main-content">
        <%--jsp layout tld 세팅 필요 필요 시 검색 후 적용--%>
        <layout:block name="content"></layout:block>
    </div>
</div>

</body>
</html>