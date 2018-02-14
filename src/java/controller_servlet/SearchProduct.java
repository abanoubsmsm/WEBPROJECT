/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller_servlet;

import child_daos_implementation.ItemDaoImplementation;
import child_daos_implementation.UserDaoImplementation;
import dtos.Item;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author abanoub samy
 */
public class SearchProduct extends HttpServlet {

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

    private ItemDaoImplementation itemImpl;

    @Override

    public void init() {

        itemImpl = new ItemDaoImplementation(dataSource);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchProduct at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchMethod = request.getParameter("serachMethod");
        System.out.println("search method ....  " + searchMethod);
        switch (searchMethod) {

            case "search by name":

                searchByName(request, response);

                break;

            case "search by price":
        {
            try {
                searchByPrice(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
                break;

        }

    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nameToSearch = request.getParameter("Search");

        if (nameToSearch.trim() != null) {

            try {

                ArrayList<Item> resultItems = itemImpl.getItemByName(nameToSearch);

                // System.out.println("item nameeeeeeeee"+resultItems.get(0).getItem_name());
                request.setAttribute("result", resultItems);

                // response.sendRedirect("HomeServlet?res");
                RequestDispatcher dis = request.getRequestDispatcher("HomeServlet?res");
                dis.forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(SearchProduct.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private void searchByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        int from = Integer.parseInt(request.getParameter("from"));
        int to = Integer.parseInt(request.getParameter("to"));

        ArrayList<Item> resultItems = itemImpl.getItemByPrice(from, to);

        // System.out.println("item nameeeeeeeee"+resultItems.get(0).getItem_name());
        request.setAttribute("result", resultItems);

        // response.sendRedirect("HomeServlet?res");
        RequestDispatcher dis = request.getRequestDispatcher("HomeServlet?res");
        dis.forward(request, response);
    }

}
