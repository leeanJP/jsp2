package com.model2.mvcboard;

import com.model1.BoardDAO;
import com.model1.BoardDTO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/test.do")
public class TestController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        String str = reader.readLine();
        System.out.println(str);
        Map<String, Object> map = new HashMap<>();

        JSONObject json = new JSONObject();
        BoardDAO dao = new BoardDAO();
        List<BoardDTO> boardList = dao.selectList(map);
        json.put("boardList", boardList);

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(json);

    }
}
