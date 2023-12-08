package com.util;

import javax.servlet.jsp.JspWriter;
import java.io.IOException;

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

}
