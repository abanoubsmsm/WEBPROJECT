/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_servlet;

import child_daos_implementation.ItemDaoImplementation;
import dtos.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Hagar
 */
@WebServlet(name = "itemtoedit", urlPatterns = {"/itemtoedit"})
public class itemtoedit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
           Item i =(Item) request.getAttribute("h");
            System.out.println("hobaaaaaaaaaaaaaa"+i.getItem_name());
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/e_commerce", "root", "");
            ItemDaoImplementation item = new ItemDaoImplementation();
            item.setCon(con);
            Item myItem = new Item();
            myItem.setItem_id(Integer.parseInt(request.getParameter("itemId")));

            myItem = item.select(myItem);

            request.setAttribute("selectedItem", myItem);
            RequestDispatcher rd = request.getRequestDispatcher("editroduct/editproduct.jsp");

            rd.forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(itemtoedit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(itemtoedit.class.getName()).log(Level.SEVERE, null, ex);
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
