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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import utils.ImageUtils;
import utils.InputStreamUtails;

/**
 *
 * @author Altysh
 */
@MultipartConfig
public class Item_Add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/e_commerce","root","");
            ItemDaoImplementation item=  new ItemDaoImplementation();
            item.setCon(con);
            Item dto = new Item();
            dto.setItem_catagory(InputStreamUtails.getStringFromInputStream(request.getPart("item_name").getInputStream()));
            dto.setItem_name(InputStreamUtails.getStringFromInputStream(request.getPart("catagory").getInputStream()));
            Part filePart = request.getPart("pic");
            dto.setItem_pic(ImageUtils.getBytesFromFile(filePart));
            
            dto.setItem_price(Integer.parseInt(InputStreamUtails.getStringFromInputStream(request.getPart("price").getInputStream())));
            dto.setItem_quntity(Integer.parseInt(InputStreamUtails.getStringFromInputStream(request.getPart("qutity").getInputStream())));
            item.insert(dto);
        } catch (SQLException ex) {
            Logger.getLogger(Item_Add.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Item_Add.class.getName()).log(Level.SEVERE, null, ex);
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
