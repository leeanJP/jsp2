<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/global.jsp"%>



<layout:extends name="base">

    <%--사용자 자바스크립트 시작--%>
    <script src="<c:url value="../js/sample.js"/>"></script>

    <script>
        $(document).readey(function){
           INDEX.init();
        });
    </script>

    <layout:put block="content">
        <%--HTML 파일 작성--%>

    </layout:put>
</layout:extends>