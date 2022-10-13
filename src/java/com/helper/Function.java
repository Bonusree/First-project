/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.helper;

import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author user
 */
public class Function {
   
    public Function(){}
    public String generateQuestionId(String session_year, String course_code){
        String res="";
        for(int i=0; i<session_year.length(); i++){
            char ch = session_year.charAt(i);
            if('0'<=ch && ch<='9'){
                res = res+ch;
            }
        }
        for(int i=0; i<course_code.length(); i++){
            char ch = course_code.charAt(i);
            if('0'<=ch && ch<='9'){
                res = res+ch;
            }
        }
        return res;
    }
    public void splitDateAndTime(String dateTime, String s[]){
        String year = dateTime.substring(0,4);
        String month = dateTime.substring(5,7);
        String day = dateTime.substring(8,10);
        String hr = dateTime.substring(11,13);
        String mn = dateTime.substring(14,16);
        s[0] = year+"-"+month+"-"+day;
        s[1] = hr+":"+mn;
    }
//    public int calculateSecond(String d1, String d2){
//        
//    }
    
    public static String findDiffFromCurrentTime(String dateString){
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-mm-dd'T'hh:mm",Locale.ENGLISH);
        try{
            long dateMillis = fmt.parse(dateString).getTime();
            long diffInSeconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis()-dateMillis);
            return Integer.toString((int) diffInSeconds);
        }catch(Exception e){
            e.printStackTrace();
            return e.getMessage();
//            return 0;
        }
    }

    
}
