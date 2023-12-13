package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet 메소드 진입");
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);
        System.out.println(uri + commandStr);
        if(commandStr.equals("/regist.one")){
            registFun(req);
        }else if(commandStr.equals("/login.one")){
            loginFun(req);
        }else if(commandStr.equals("/freeboard.one")){
            freeboardFun(req);
        }

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.getRequestDispatcher("/13/FrontController.jsp").forward(req,resp);

    }

    //페이지별 처리 메서드
    void registFun(HttpServletRequest req){
        System.out.println("회원가입");
        req.setAttribute("resultValue", "<h4>회원가입</h4>");
    }

    void loginFun(HttpServletRequest req){
        req.setAttribute("resultValue", "<h4>로그인</h4>");
    }
    void freeboardFun(HttpServletRequest req){
        req.setAttribute("resultValue", "<h4>자유게시판</h4>");
    }



}
