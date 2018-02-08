/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_servlet;

import child_daos_implementation.UserDaoImplementation;
import dtos.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author abanoub samy
 */
public class EditUserProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    
      @Resource(name = "jdbc/eCommerce")
    private DataSource dataSource;

    private UserDaoImplementation userImpl;

    @Override

    public void init() {

        userImpl = new UserDaoImplementation(dataSource);

    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditUserProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserProfile at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
                   
      


      
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
      //  processRequest(request, response);
      
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");
        String address = request.getParameter("userAddress");
        String userJob = request.getParameter("userJop");
        Double userCredit = Double.valueOf(request.getParameter("userCredit"));
        
        System.out.println(userName);
        System.out.println(userEmail);
        System.out.println(password);
        System.out.println(address);
        System.out.println(userJob);
        System.out.println(userCredit);
        
          User newUser = new User();

            newUser.setUserName(userName);
            newUser.setUserEmail(userEmail);
            newUser.setUserPassword(password);
            newUser.setUserAddress(address);
            newUser.setUserGender("male");
            newUser.setUserJop(userJob);
            newUser.setUserCredit(userCredit);
           
             if(userImpl.update(newUser))
             {
                 
                 System.out.println("user updated successfully");
             }
             
             else
             {
                 System.out.println("error in updateding user");
                 
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
