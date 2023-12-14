package com.util;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class JSFunction {


    public static void alertLocation(String msg, String url, JspWriter out){
        try {
            String script = ""
                    + "<script>"
                    +"  alert('"+msg + "');"
                    +"  location.href ='" +url + "';"
                    +"</script>";
            out.print(script);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void alertLocation(HttpServletResponse resp, String msg, String url){
        try {
            resp.setContentType("text/html;charSet=UTF-8");
            PrintWriter writer = resp.getWriter();

            String script = ""
                    + "<script>"
                    +"  alert('"+msg + "');"
                    +"  location.href ='" +url + "';"
                    +"</script>";
            writer.print(script);
        } catch (IOException e) {
        }
    }
    public static void alertBack(String msg, JspWriter out){
        try{
            String script = ""
                    + "<script>"
                    +"  alert('"+msg + "');"
                    +"  history.back();"
                    +"</script>";
            out.print(script);
        }catch (Exception e){

        }
    }

    public static void alertBack(HttpServletResponse resp ,String msg){
        try{
            resp.setContentType("text/html;charSet=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = ""
                    + "<script>"
                    +"  alert('"+msg + "');"
                    +"  history.back();"
                    +"</script>";
            writer.print(script);
        }catch (Exception e){

        }
    }
}
