package com.model2.mvcboard;

import com.fileupload.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //매개변수
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
        String idx = req.getParameter("idx");

        //파일 다운로드
        FileUtil.download(req,resp, "/upload", sfile,ofile);

        //파일 다운로드 수 증가
        MVCBoardDAO dao = new MVCBoardDAO();
        dao.updateDownCount(idx);
        dao.close();

    }
}
