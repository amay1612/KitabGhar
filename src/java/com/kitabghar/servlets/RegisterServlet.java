/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kitabghar.servlets;

import com.kitabghar.dao.UserDao;
import com.kitabghar.entities.User;
import com.kitabghar.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            //fetching data....
          String check=request.getParameter("check");
            System.out.println("=====================================================================================");
            System.out.println(check);
            System.out.println("======================================================================================");
            if(check == null)
            {
                out.println("Box is not checked");
            }
            else
            {
                //retrieve data...
                 String name=request.getParameter("user_name");
                String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                String college=request.getParameter("user_college");
                String gender=request.getParameter("gender");
                String about=request.getParameter("about");
               
                
                User user=new User(name,email,password,college,gender,about);
                
                
                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                if(dao.saveuser(user))
                {
                    out.println("done");
                }
                else
                {
                    out.println("Error");
                }
            }
            
            
            
            
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
