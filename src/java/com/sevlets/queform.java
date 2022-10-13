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
public class queform extends HttpServlet {

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
            out.println("<title>Servlet queform</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session =  request.getSession();
            
            
            RequestDispatcher rd = request.getRequestDispatcher("active.jsp");
            
            UserDao db = new UserDao();
            Function helper = new Function();

            if(session.getAttribute("number_of_question")==null && request.getParameter("isUpdate").equals("true")==false ){
                if(request.getParameter("session_year")==null){
                    rd.forward(request, response);
                }
                String questionId = helper.generateQuestionId(request.getParameter("session_year"),request.getParameter("course_code"));
                String password = db.getPasswordOfQuestionSet(questionId);
                
                if(password.equals(request.getParameter("password"))==false){
                    out.println("this "+password+"<br>");
                    out.println(questionId);
                    out.println("<h3 style=\"color:red;\">Wrong Password!!</h3>");
                    rd.include(request, response);
                }
                else{
                    int number_of_question = db.getNumberOfQuestion(questionId);
                    out.println("number of que "+number_of_question+" question "+questionId);
                    session.setAttribute("number_of_question", number_of_question);
                    session.setAttribute("questionId",questionId);
                    rd.include(request, response);
                }
            }
            else{
                String questionId = (String) session.getAttribute("questionId");
                out.println("null question id "+questionId);
                int number_of_question = db.getNumberOfQuestion(questionId);
                out.println("null question id "+number_of_question+"<br>");
                String qry_res=null;
                String allData[][] = new String[number_of_question+1][7];
                for(int i=1; i<=number_of_question; i++){
                    String data[]= new String[7];
                    data[0]=questionId;
                    data[1] = request.getParameter("question_"+Integer.toString(i));
                    for(int j=1; j<5; j++){
                        data[j+1] = request.getParameter("question_"+Integer.toString(i)+"_"+Integer.toString(j));
                    }
                    data[6] = request.getParameter("question_"+Integer.toString(i)+"_r");
                    for(int j=0; j<7; j++){
                        out.println(i+" <> "+j+" <> "+data[j]+"<br>");
                    }
                    if(qry_res==null || qry_res.equals("done")){
                        out.println("<h3> qry "+qry_res+" isupdate "+request.getParameter("isUpdate")+"</h1>");
                        if(request.getParameter("isUpdate")!=null){
//                            qry_res = db.updateQuestion(data);
                            allData[i]=data;
                            out.println("QRY RESUT "+allData[i]+"<br>");
                        }
                        else{
                            qry_res = db.storeQuestionAndOption(data);
                            out.println("QRY RESUT update "+qry_res+"<br>");
                        }
                    }
                }
                if(request.getParameter("isUpdate")!=null){
                    qry_res = db.updateQuestion(allData);
                    out.println("QRY RESUT "+qry_res+"<br>");
                }
                out.println("<h3>"+qry_res+"</h1>");
                rd.include(request, response);
                session.removeAttribute("number_of_question");
                session.removeAttribute("questionId");
            }
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
            Logger.getLogger(queform.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(queform.class.getName()).log(Level.SEVERE, null, ex);
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
