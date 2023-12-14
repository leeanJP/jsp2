package com.model2.mvcboard;

import com.fileupload.FileUtil;
import com.util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/14/Write.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/upload");

        //파일 업로드
        String oFileName = "";
        try {
            oFileName = FileUtil.uploadFile(req, saveDir);
        }catch (Exception e){
            System.out.println("WriteController doPost 오류 발생");
        }

        //폼값을 DTO에 저장
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setName(req.getParameter("name"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setPass(req.getParameter("pass"));

        if(oFileName != ""){
            //파일명 변경
            String savedFileName = FileUtil.renameFile(saveDir, oFileName);
            dto.setOfile(oFileName);
            dto.setSfile(savedFileName);

        }

        //DAO를 통해 DB에 게시글 저장
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if(result == 1){ //글쓰기 완료
            resp.sendRedirect("../mvcboard/list.do");
        }else{
            JSFunction.alertLocation(resp,"글쓰기에 실패했습니다.", "../mvcboard/write.do");
        }

    }
}
