package com.el;

public class MyElClass {
    //주민번호 입력받아서 성별을 반환하는 메소드
    public String getGender(String jumin){
        String returnStr = "";
        int beginIndex = jumin.indexOf("-") + 1;
        String genderStr = jumin.substring(beginIndex, beginIndex+1);
        int genderInt = Integer.parseInt(genderStr);
        if(genderInt == 1 || genderInt == 3){
            returnStr = "남자";
        }else if(genderInt == 2 || genderInt == 4){
            returnStr = "여자";
        }else {
            returnStr = "주민번호 오류";
        }
        return returnStr;
    }

    //입력받은 문자열이 숫자인지 판별
    public static boolean isNumber(String val){
        char[] chArr = val.toCharArray();
        for(int i=0; i<chArr.length; i++){
            if(!(chArr[i] >='0' && chArr[i]<='9')){
                return false;
            }
        }
        return true;
    }

    //입력받은 정수까지의 구구단을 HTML 테이블로 출력하는 메소드
    public static String showGugudan(int limitDan){
        StringBuffer sb = new StringBuffer();
        try {
            sb.append("<table border='1'>");
            for(int i=2; i<=limitDan; i++){
                sb.append("<tr>");
                for(int j=1; j<=9; j++){
                    sb.append("<td>" + i + "X " + j + "=" + (i*j) + "</td>");
                }
                sb.append("</tr>");
            }
            sb.append("</table>");

        }catch (Exception e){
            e.printStackTrace();
        }


        return sb.toString();
    }


}
