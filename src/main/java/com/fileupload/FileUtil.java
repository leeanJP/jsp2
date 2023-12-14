package com.fileupload;

import com.util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUtil {
    //파일 업로드
    public static String uploadFile(HttpServletRequest req , String sDir) throws ServletException , IOException {
        //Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");

        //Part 객체의 헤더값 content-disposition 값 읽기
        String partHeader = part.getHeader("content-disposition");
        //form-data; name="attachedFile"; filename="파일명.확장자"
        System.out.println("partHeader ::" + partHeader);
        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName  = phArr[1].trim().replace("\"" , "");

        //전송된 파일이 있다면 디렉토리에 저장
        if(!originalFileName.isEmpty()){
            part.write(sDir+ File.separator + originalFileName);
        }

        //원본 파일명 반환
        return originalFileName;

    }

    //파일명 변경
    public static String renameFile(String sDir, String fileName){
        //확장자 잘라내기
        String ext = fileName.substring(fileName.lastIndexOf("."));

        //날짜 및 시간을 통해 파일명 생성
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());

        //날짜_시간.확장자 새로운 파일명 생성
        String newFileName = now + ext;

        //기존 파일명을 새 파일명으로 변경
        File oldFile = new File(sDir+File.separator+fileName);
        File newFile = new File(sDir+File.separator+newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }


    //파일 다운로드
    public static void download(HttpServletRequest req, HttpServletResponse resp, String dir, String sfileName, String ofileName){
        String sDir = req.getServletContext().getRealPath(dir);
        try {
            //파일을 찾아 입력 스트림 생성
            File file = new File(sDir, sfileName);
            InputStream inStream = new FileInputStream(file);

            String client = req.getHeader("User-Agent");
            if(client.indexOf("WOW64") == -1){ //익스플로러가 아닌 경우
                ofileName = new String(ofileName.getBytes("UTF-8"),  "ISO-8859-1");
                System.out.println("확인 :"  + ofileName);
            }else { //익스플로러인 경우
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }
            //파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream; charset=utf-8");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName);
            resp.setHeader("Content-Length", ""+ file.length());
            //response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream outStream =  resp.getOutputStream();
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
            System.out.println("파일을 찾을 수 없음");
            e.printStackTrace();
        }catch (Exception e){
            System.out.println("파일 다운로드 중 예외 발생");
            e.printStackTrace();
        }
    }

}
