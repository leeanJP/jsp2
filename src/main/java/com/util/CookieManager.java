package com.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

    public static void makeCookie(HttpServletResponse res, String cName, String cValue, int cTime){
        Cookie cookie = new Cookie(cName, cValue);
        cookie.setPath("/");
        cookie.setMaxAge(cTime);
        res.addCookie(cookie);

    }

    public static String readCookie(HttpServletRequest req, String cName){
        String cookieVal = ""; // 쿠키 값
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                String cookieName = c.getName();
                if(cookieName.equals(cName)){
                    cookieVal = c.getValue();
                }
            }
        }

        return cookieVal;
    }

    public static void deleteCookie(HttpServletResponse res, String cName){
        makeCookie(res, cName, "",0);
    }
}
