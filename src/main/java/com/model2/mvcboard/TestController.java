package com.model2.mvcboard;

import com.model1.BoardDAO;
import com.model1.BoardDTO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/test.do")
public class TestController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        String mode = req.getParameter("mode");
        String param1 = req.getParameter("param1");
        Map<String, Object> param = new HashMap<>();
        System.out.println(mode + " :: " + param1);

        JSONObject json = new JSONObject();
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardList = dao.selectList(param);
        json.put("boardList", boardList);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);

    }
}
