/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFlix;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gil
 */
@WebServlet(name = "ShareMovie", urlPatterns = {"/ShareMovie"})
public class ShareMovie extends HttpServlet {

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
            throws ServletException, IOException {
        
        String sharedName = request.getParameter("sharedName");
        String imdbID = request.getParameter("imdb");
        String button = request.getParameter("button");
        System.out.println(button);
        if (null == button)
            button = "";
                System.out.println(button);

        Connection conn = new DBControl().connectDB();
        try {
            Statement stmt = conn.createStatement();
            
            String query;
            if (button.equals("return")) {
                query = "UPDATE ownership SET sharedName=\"\", shared=0 WHERE imdbId=\""
                        +imdbID+"\" AND userId="
                        +request.getSession().getAttribute("id")+";";
            }
            else {
                query = "UPDATE ownership SET sharedName=\""+ sharedName 
                        +"\", shared=1 WHERE imdbId=\""+imdbID+"\" AND userId="
                        +request.getSession().getAttribute("id")+";";
            }
            
            System.out.println(query);
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(ShareMovie.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("Collection");
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
