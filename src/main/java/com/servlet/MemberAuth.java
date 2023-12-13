package com.servlet;

import com.membership.MemberDAO;
import com.membership.MemberDTO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberAuth extends HelloServlet{
    private static final long serialVersionUID = 1L;
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        //어플리케이션 내장객체
        ServletContext app = this.getServletContext();

        //DAO 생성
        dao = new MemberDAO();

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //서블릿 초기화 매개변수에서 관리자 ID 받기
        String admin_id = this.getInitParameter("admin_id");

        //인증을 요청한 ID /PWD 받기
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        MemberDTO dto = dao.getMemberDTO(id,pass);

        String memberName = dto.getName();
        System.out.println(dto.getName() );
        if(memberName != null){
            req.setAttribute("authMsg" ,memberName + " 회원님 반갑습니다.");
        }else{//일치하는 회원이 없는경우
            if(admin_id.equals(id)){
                req.setAttribute("authMsg" ,admin_id + " 는 최고 관리자입니다.");
            }else { //비회원
                req.setAttribute("authMsg" ,"비회원입니다.");

            }
        }
        req.getRequestDispatcher("/13/MemberAuth.jsp").forward(req,resp);
    }

    @Override
    public void destroy() {
        dao.close();
    }
}
