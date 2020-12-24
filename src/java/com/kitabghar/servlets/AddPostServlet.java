/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kitabghar.servlets;

import com.kitabghar.dao.PostDao;
import com.kitabghar.entities.Post;
import com.kitabghar.entities.User;
import com.kitabghar.helper.ConnectionProvider;
import com.kitabghar.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPostServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int cid = Integer.parseInt(request.getParameter("cid"));
            String bname = request.getParameter("bname");
            String author = request.getParameter("authorname");
            Part part = request.getPart("bpic");
            String imageName = part.getSubmittedFileName();
            int bprice = Integer.parseInt(request.getParameter("bprice"));
            String address = request.getParameter("address");
             HttpSession session = request.getSession();
             User user = (User) session.getAttribute("currentuser");
//            System.out.println("===============================================================================");
//            System.out.println(user.getName());
//            System.out.println(user.getId());
//            System.out.println("================================================================================================");
            String contact=request.getParameter("contact");
           
           
            
            Post post=new Post(bname,contact,bprice,imageName,address,author,cid,user.getId());
            PostDao dao=new PostDao(ConnectionProvider.getConnection());
            if(dao.savePost(post))
            {
                
                String path = request.getRealPath("/") + "uploadBookPics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(),path);
                out.println("done");
            }
            else
            {
                out.println("error come");
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
