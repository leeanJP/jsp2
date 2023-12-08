<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<%
    String popupMode = "on"; //팝업창 출력 여부
%>
<head>
    <title>Title</title>
    <style>
        div#popup{
            position: absolute; top: 100px; left: 50px; color: yellow;
            width: 270px; height: 100px; background-color: gray;
        }
        div#popup>div{
            position: relative;background-color: #fff; top: 0px;
            border:1px solid gray; padding-top: 10px; color: black;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
    <h2>팝업 메인 페이지</h2>
    <%
        for(int i=1; i<=10; i++){
            out.println("현재 팝업창은 " + popupMode + "상태입니다</br/>");
        }

        if(popupMode.equals("on")){

    %>
        <div id="popup">
            <h2 align="center">공지사항 팝업</h2>
            <div align="right">
                <form name="popFrm">
                    <input type="checkbox" id="inactiveToday" value="1"/>
                    하루동안 열지않음
                    <input type="button" value="닫기" id="closeBtn">
                </form>
            </div>
        </div>
    <%
        }
    %>

    <script>
        $("#closeBtn").click(function (){
           $("#popup").hide();
        });

    </script>




</body>
</html>
