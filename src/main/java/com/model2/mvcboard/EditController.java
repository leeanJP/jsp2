package com.model2.mvcboard;

import com.fileupload.FileUtil;
import com.util.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig(maxFileSize = 1048576, maxRequestSize = 10485760)
public class EditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idx = req.getParameter("idx");
        MVCBoardDAO dao = new MVCBoardDAO();
        MVCBoardDTO dto = dao.selectView(idx);

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/14/Edit.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/upload");

        //파일 업로드
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDir);
        }catch (Exception e){
            JSFunction.alertBack(resp, "파일 업로드 오류");
            return;
        }

        //DB에 update 데이터 입력
        String idx = req.getParameter("idx");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");
        System.out.println("세션에서 받아온 패스 : "+pass);
        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setIdx(idx);
        dto.setName(name);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setPass(pass);

        if (originalFileName != "") {
            String savedFileName = FileUtil.renameFile(saveDir, originalFileName);

            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);

            FileUtil.deleteFile(req, "upload", prevSfile);
        }else {
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }

        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) {
            session.removeAttribute("pass");
            resp.sendRedirect("../mvcboard/view.do?idx=" + idx);
        }else {
            JSFunction.alertLocation(resp, "비밀번호 검증 다시 해주세요", "../mvcboard/view.do=?idx=" + idx);
        }






    }
}
