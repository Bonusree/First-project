/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.sevlets;

import com.dao.UserDao;
import com.helper.Function;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class queinfoform extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet queinfoform</title>");            
            out.println("</head>");
            out.println("<body>");
            Function user_helper_funtion= new Function();
            
            String data[] = new String[11];
            data[1] = request.getParameter("dept_name");
            data[2] = request.getParameter("course_name");
            data[3] = request.getParameter("course_code");
            data[4] = request.getParameter("session_year");
            data[5] = request.getParameter("password");
            
            String dateTime[] = new String[2];
           // out.println(request.getParameter("start_time"));
            user_helper_funtion.splitDateAndTime( request.getParameter("start_time"), dateTime);
            data[6]=dateTime[0];
            data[7]=dateTime[1];
            //out.println("bonusree 3");
            out.println(request.getParameter("start_time"));
            user_helper_funtion.splitDateAndTime(request.getParameter("end_time"), dateTime);
            data[8]=dateTime[0];
            data[9]=dateTime[1];
            
            data[10] = request.getParameter("number_of_question");
            data[0] = user_helper_funtion.generateQuestionId(data[4], data[3]);
            
            UserDao storeQueInfo = new UserDao();
            out.println(storeQueInfo.storeQuestionInformation(data));
            
            HttpSession session = request.getSession();
            session.setAttribute("number_of_question", data[10]);
            session.setAttribute("questionId", data[0]);
            
            RequestDispatcher rd = request.getRequestDispatcher("admin_que_info.jsp");
            rd.include(request, response);
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(queinfoform.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(queinfoform.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
