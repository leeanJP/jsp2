package com.model2.mvcboard;

import com.membership.MemberDAO;
import com.util.BoardPage;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //DAO 생성
        MVCBoardDAO dao = new MVCBoardDAO();

        //뷰에 전달할 맵 생성
        Map<String, Object> map = new HashMap<>();

        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");

        if(searchWord != null){
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        int totalCount = dao.selectCount(map);

        /*페이징 처리 시작*/
        ServletContext app = getServletContext();

        int pageSize = Integer.parseInt(app.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(app.getInitParameter("POSTS_PER_BLOCK"));

        //현재 페이지 확인
        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if(pageTemp != null && !pageTemp.equals("")){
            pageNum = Integer.parseInt(pageTemp);
        }

        int start = (pageNum -1) * pageSize +1;
        int end = pageNum * pageSize;

        map.put("start", start);
        map.put("end", end);
        /*페이징 처리 끝*/

        List<MVCBoardDTO> boardList = dao.selectListPage(map);

        dao.close();

        //뷰에 전달할 변수 추가
        String pagingImg = BoardPage.pagingStr(totalCount,pageSize,blockPage,pageNum, "../mvcboard/list.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum",pageNum);

        req.setAttribute("boardList",boardList);
        req.setAttribute("map",map);
        req.getRequestDispatcher("/14/List.jsp").forward(req,resp);


    }
}
