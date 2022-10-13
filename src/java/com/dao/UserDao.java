/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.entities.user;
import static java.lang.System.out;
import java.sql.*;
import java.sql.PreparedStatement;

/**
 *
 * @author user
 */
public class UserDao {

    private static Connection con;

    public UserDao() throws SQLException {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1/oemsre";
        String root = "root";
        String db_pass = "";
        try {
            Class.forName(driver);
            this.con = DriverManager.getConnection(url, root, db_pass);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public String saveUser(String name, String email, String password) throws SQLException {
        boolean f = false;
        try {
            String query = "insert into user(name,email,password) values(?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.executeUpdate();

        } catch (Exception e) {
            return e.getMessage();
        }

        return "done";

    }

    
    public String getSingleColumnByEmail(String email,String columnName) {
//       String query = "SELECT password FROM user WHERE email='" + email+ "'and password='"+password;
        String ep = "";
        boolean f=false;
        try {
          String query="SELECT "+columnName+" FROM user WHERE email='"+email+"';";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                ep = rs.getString(columnName);
                f=true;
            }
            else {
                return "this email is valid";
            }
        } catch (Exception e) {
//           out.println( e.getMessage());
//           return false;
        }
        return ep;

    }
    public int  activeExam(String[][] data) throws SQLException{
        String query= " SELECT * from `questioninformation` WHERE end_date>CURRENT_DATE or ( end_time>=CURRENT_TIME and end_date=CURRENT_DATE);";
         int i=0;
        try {
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet rs=pstmt.executeQuery();
           
            while(rs.next())
            {
                data[i][0] = rs.getString("session_year");
                data[i][1] = rs.getString("course_name");
                data[i][2] = rs.getString("course_code");
                data[i][3] = rs.getString("starttime");
                data[i][4] = rs.getString("endtime");
               
              i++;
            }
        } catch (Exception e) {
        }
       
        return i;
    }
    
     public int  finishedExam(String[][] data) throws SQLException{
        String query= "SELECT * from `questioninformation` WHERE end_date<CURRENT_DATE or ( end_time<CURRENT_TIME and end_date=CURRENT_DATE);";
         int i=0;
        try {
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet rs=pstmt.executeQuery();
           
            while(rs.next())
            {
                data[i][0] = rs.getString("session_year");
                data[i][1] = rs.getString("course_name");
                data[i][2] = rs.getString("course_code");
                data[i][3] = rs.getString("starttime");
                data[i][4] = rs.getString("endtime");
               
              i++;
            }
        } catch (Exception e) {
        }
       
        return i;
    }
    
//    SELECT * FROM `questioninformation` WHERE start_date>=CURRENT_DATE and start_time<=CURRENT_TIME;
    public String storeQuestionInformation(String[] data) throws SQLException {
        //ei exam sesh kina track kora jete pare
        String qry = "insert into questioninformation values(";
        for (int i = 0; i < data.length; i++) {
            if (i + 1 < data.length) {
                qry += "?,";
            } else {
                qry += "?);";
            }
        }
//        return qry;
        try {
            PreparedStatement pstmnt = con.prepareStatement(qry);
            for (int i = 0; i < data.length; i++) {
                pstmnt.setString(i + 1, data[i]);
            }
            pstmnt.execute();
        } catch (Exception e) {
            return e.getMessage();
        }
        return "done";
    }

    public String getPasswordOfQuestionSet(String questionId) {
        String qry = "select password from questioninformation where QuestionId=" + questionId;
        String res = "";
        try {
            PreparedStatement pstmnt = con.prepareStatement(qry);
            
            ResultSet rs = pstmnt.executeQuery();
            if (rs.next()) {
                res = rs.getString(1);
            }
        } catch (Exception e) {
            return e.getMessage();
        }
        return res;
    }

    public int getNumberOfQuestion(String questionId) {
        String qry = "select number_of_question from questioninformation where QuestionId=" + questionId;
        int res = 0;
        try {
            PreparedStatement pstmnt = con.prepareStatement(qry);
            ResultSet rs = pstmnt.executeQuery();
            if (rs.next()) {
                res = Integer.parseInt(rs.getString(1));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }

    public String storeQuestionAndOption(String data[]) {
        String qry = "insert into questionlist values(?,?,?,?,?,?,?)";
        PreparedStatement pstmnt;
        try {
            pstmnt = con.prepareStatement(qry);
            for (int i = 0; i < 7; i++) {
                pstmnt.setString(i + 1, data[i]);
            }
//            return pstmnt.toString();
            pstmnt.execute();
        } catch (Exception ex) {
            return ex.getMessage();
        }

        return "done";

    }

    public String getQuestionById(String questionId, String question[], String option[][]) {
        String query = "SELECT * FROM questionlist WHERE QuestionId = '" + questionId + "';";
        question[10] = "is it ok";
        question[11] = query;
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            int i = 1;
            while (rs.next()) {
                question[i] = rs.getString("Question");
                option[i][1] = rs.getString(3);
                option[i][2] = rs.getString(4);
                option[i][3] = rs.getString(5);
                option[i][4] = rs.getString(6);
                option[i][5] = rs.getString(7);
                i++;
            }

        } catch (Exception e) {
            e.getMessage();
//            return "not done";
        }
        return "done";
    }

    public String updateQuestion(String allData[][]) throws SQLException {
        String query = "DELETE FROM questionlist WHERE QuestionId = '" + allData[1][0] + "';";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.execute();

        } catch (Exception e) {
            return e.getMessage();
        }
        String ret = "done";
        for (int i = 1; i < allData.length && ret.equals("done"); i++) {
            ret = this.storeQuestionAndOption(allData[i]);
        }
        return ret;
    }
}
