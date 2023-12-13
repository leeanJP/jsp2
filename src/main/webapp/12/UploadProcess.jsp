<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>
<%@ page import="com.fileupload.MyFileDTO" %>
<%@ page import="com.fileupload.MyFileDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    //저장할 디렉토리
    String saveDir = application.getRealPath("/upload");
    //파일 최대크기(1MB)
    long maxSize = 1024 * 1000;
    //인코딩 방식
    String encoding = "UTF-8";


    try{
        //1. MultipartRequest 객체 생성
        System.out.println("1");
        MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encoding);
        System.out.println("2");

        //2. 새로운 파일명 생성
        String fileName = mr.getFilesystemName("attachedFile"); //현재 파일이름
        String ext = fileName.substring(fileName.lastIndexOf(".")); //파일 확장자
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + ext; //새로운 파일이름 (업로드일시.확장자)

        //3. 파일명 변경
        File oldFile = new File(saveDir + File.separator + fileName);
        File newFile = new File(saveDir + File.separator + newFileName);
        oldFile.renameTo(newFile);

        //4. 다른 폼값 받기
        String title = mr.getParameter("title");
        String[] cateArr = mr.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();

        if(cateArr == null){
            cateBuf.append("선택없음");

        }else{
            for(String s : cateArr){
                cateBuf.append(s+ ",");
            }
        }
        //5. DTO 생성
        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(fileName);
        dto.setSfile(newFileName);

        //6. DAO 통해 DB에 입력
        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();

        //7. 파일목록 리다이렉션
        response.sendRedirect("FileList.jsp");

    }catch (Exception e ){
        e.printStackTrace();
        System.out.println("파일 업로드 오류 ");
        request.setAttribute("errMsg", "파일 업로드 오류");
        request.getRequestDispatcher("FileUploadMain.jsp").forward(request,response);
    }

%>