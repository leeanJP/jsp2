<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>

</head>
<body>


    <h2>파일 첨부형 게시판 - 상세 보기</h2>
    <table border="1" width="90%">
        <col width="15%"/>
        <col width="35%"/>
        <col width="15%"/>
        <col width="*"/>

        <%--게시글 정보--%>
        <tr>
            <td>번호</td>
            <td>${dto.idx}</td>
            <td>작성자</td>
            <td>${dto.name}</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td>${dto.postdate}</td>
            <td>조회수</td>
            <td>${dto.visitcount}</td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3">${dto.title}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
                ${dto.content}
                <c:if test="${not empty dto.ofile and isImage == true}">
                    <br><img src="../upload/${dto.sfile}" style="max-width: 100%"/>
                </c:if>
            </td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <c:if test="${not empty dto.ofile}">
                    ${dto.ofile}
                    <a href="../mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">
                        [다운로드]
                    </a>
                </c:if>
            </td>
            <td>다운로드 수</td>
            <td>${dto.downcount}</td>
        </tr>
        <%--하단 메뉴--%>
        <tr>
            <td colspan="4" align="center">
                <button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">수정</button>
                <button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">삭제</button>
                <button type="button" id="test">불러오기</button>
                <button type="button" onclick="location.href='../mvcboard/list.do';">목록</button>
            </td>
        </tr>
    </table>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/jquery.ajax-cross-origin.min.js"></script>
    <script type="module", src="../js/test.mjs "></script>
    <script src="<c:url value="../js/importTest.js"/>"></script>
    <script>
        $(document).ready(function() {
            // $.ajax({
            //     url: "https://cdn.merakianalytics.com/riot/lol/resources/latest/en-US/champions.json",
            //     type: 'POST',
            //     crossDomain: true,
            //     contentType : 'application/json; charset=UTF-8',
            //     dataType: 'json',
            //     success: function (data) {
            //         console.log("통신데이터 값 : " + data);
            //     },
            //     error: function (request,status,error) {
            //         console.log('통신실패!!');
            //         console.log(request);
            //         console.log(status);
            //         console.log(error);
            //         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            //     },
            // });

            $("#test").on("click",function (){
                let param = {mode:"모드", param1:"파라메터"};
                $.ajax({
                    url: "../test.do",
                    type: 'POST',
                    contentType : 'application/json; charset=UTF-8',
                    dataType: 'json',
                    //data :param,
                    data :JSON.stringify(param),
                    success: function (data) {
                        console.log("데이터 값 : " + JSON.stringify(data));
                    },
                    error: function (request,status,error) {
                        console.log('통신실패!!');
                    },
                });

            })

        });
    </script>
</body>
</html>
