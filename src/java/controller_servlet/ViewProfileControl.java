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
import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Mayada Saleh
 */
public class ViewProfileControl extends HttpServlet {

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
            out.println("<title>Servlet ViewProfileControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProfileControl at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        
        try {
			
			String theCommand = request.getParameter("command");
			
			
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			
			switch (theCommand) {
			
			case "LIST":
				listUsers(request, response);
				break;
				
			case "LOAD":
				loadUsers(request, response);
				break;
				
			default:
				listUsers(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
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



    private void listUsers(HttpServletRequest request, HttpServletResponse response)throws Exception  {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    
     
		 ArrayList<User> users = null;
                 users = userImpl.reterieveAll();
		
	
		request.setAttribute("Users_LIST", users);
				
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listusers/listUsersToAdmin.jsp");
		dispatcher.forward(request, response);
    
    }

    private void loadUsers(HttpServletRequest request, HttpServletResponse response) throws Exception  {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
   
       String theUserMail = request.getParameter("usermail");
       
       User t=new  User();
       t.setUserEmail(theUserMail);
       t=userImpl.select(t);
       
       request.setAttribute("ViewedUser", t);
       
       RequestDispatcher dispatcher = request.getRequestDispatcher("/listusers/viewUserProfile.jsp");
		dispatcher.forward(request, response);
       
       
               System.out.println(t.getUserId());
               System.out.println(t.getUserCredit());
               
    
    
    
    }

}
