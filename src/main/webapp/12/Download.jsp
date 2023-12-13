<%@ page import="com.util.JSFunction" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String saveDir = application.getRealPath("/upload");
    String saveFileName = request.getParameter("sName");
    String originalFileName = request.getParameter("oName");

    System.out.println(originalFileName);
    try {
        //파일을 찾아 입력 스트림 생성
        File file = new File(saveDir, saveFileName);
        InputStream inStream = new FileInputStream(file);

        String client = request.getHeader("User-Agent");
        if(client.indexOf("WOW64") == -1){ //익스플로러가 아닌 경우
            originalFileName = new String(originalFileName.getBytes("UTF-8"),  "ISO-8859-1");
            System.out.println("확인 :"  + originalFileName);
        }else { //익스플로러인 경우
            originalFileName = new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
        }

        //파일 다운로드용 응답 헤더 설정
        response.reset();
        response.setContentType("application/octet-stream; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName);
        response.setHeader("Content-Length", ""+ file.length());

        //출력 스트림 초기화
        out.clear();

        //response 내장 객체로부터 새로운 출력 스트림 생성
        OutputStream outStream =  response.getOutputStream();

        //출력 스트림에 파일 내용 출력
        byte[] b = new byte[(int)file.length()];
        int readBuffer = 0;
        while ( (readBuffer = inStream.read(b)) >0){
            outStream.write(b,0,readBuffer);
        }
        //입출력 스트림 닫음
        inStream.close();
        outStream.close();

    }catch (FileNotFoundException e){
        JSFunction.alertBack("파일을 찾을 수 없습니다", out);
    }catch (Exception e){
        JSFunction.alertBack("예외가 발생 했습니다.", out);
    }

%>