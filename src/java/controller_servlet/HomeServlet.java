/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_servlet;

import child_daos_implementation.ItemDaoImplementation;
import child_daos_implementation.UserDaoImplementation;
import dtos.Item;
import dtos.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import utils.ArrayUtail;

/**
 *
 * @author abanoub samy
 */
public class HomeServlet extends HttpServlet {

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

  
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/e_commerce", "root", "");
            ItemDaoImplementation item = new ItemDaoImplementation();
            item.setCon(con);
            ArrayList<Item> list = item.getItem(0);
            System.out.println(list.size());
            System.out.println(ArrayUtail.getArray(list).size());
            
            request.setAttribute("list", ArrayUtail.getArray(list));
            
            
            
            
            checkLogIn(request, response);
          
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       
       
        String check = request.getQueryString();
            if(check!=null&&check.equals("res"))
            {
            
            ArrayList<Item> list2 =(ArrayList<Item>) request.getAttribute("result");
            request.setAttribute("list", ArrayUtail.getArray(list2));
            
            
                checkLogIn(request, response);
            
            }
       
    }

    public void checkLogIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
        
          
            Cookie cookies[] = request.getCookies();
            
            if (cookies != null) {
                
                User newUser = new User();
                for (Cookie temp : cookies) {
                    
                    if (temp.getName().equals("userEmail")) {
                        
                        newUser.setUserEmail(temp.getValue());
                        newUser = userImpl.select(newUser);
                        HttpSession userSession = request.getSession(true);
                        userSession.setAttribute("logedInUser", newUser);
                        if (newUser.getUserType().equals("user")) {
                            
                            RequestDispatcher d = request.getRequestDispatcher("/products.jsp?logedIn=true");
                            d.forward(request, response);
                            //response.sendRedirect("products.jsp?logedIn=true");
                        } else {
                             RequestDispatcher d = request.getRequestDispatcher("/products.jsp?logedIn=true&admin=true");
                            d.forward(request, response);
                           // response.sendRedirect("products.jsp?logedIn=true&admin=true");
                        }
                        
                    }
                }
                
            } 
            
            else {
                response.sendRedirect("../products.jsp");
                
            }
    }
}
