<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>FileUpload</title>
</head>
<body>
  <script type="text/javascript">
    function validateForm(form){
      console.log(form.title.value);
      if(!form.title.value){
        alert("제목을 입력 하세요");
        form.title.focus();
        return false;
      }
      if(!form.name.value){
        alert("작성자를 입력 하세요");
        form.name.focus();
        return false;
      }
      if(!form.attachedFile.value){
        alert("첨부파일은 필수 입력 입니다.");ㄹ
        return false;
      }
    }
  </script>
</body>
  <h2>파일 업로드</h2>
  <span style="color: red">${errMsg}</span>
  <form name="fileForm" method="post" enctype="multipart/form-data"
         action="UploadProcess.jsp" onsubmit="return validateForm(this);">
    작성자 : <input type="text" name="name" value="머스트해브"/> <br/>
    제목 : <input type="text" name="title"/> <br/>
    카테고리 (선택사항) :
      <input type="checkbox" name="cate" value="사진" checked/>사진
      <input type="checkbox" name="cat
      e" value="과제" />과제
      <input type="checkbox" name="cate" value="워드" />워드
      <input type="checkbox" name="cate" value="음원" />음원 <br/>
    첨부파일 : <input type="file" name="attachedFile" /> <br/>
    <input type="submit" value="전송하기"/>
  </form>
</html>
