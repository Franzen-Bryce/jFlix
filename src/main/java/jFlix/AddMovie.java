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
 * @author Bryce
 */
@WebServlet(name = "AddMovie", urlPatterns = {"/AddMovie"})
public class AddMovie extends HttpServlet {

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
       
        String movieTitle = request.getParameter("Title");
        String nameShared = "";
        String movieGenre = request.getParameter("genre");
        String moviePoster = request.getParameter("poster");
        int userId;
        String imdbId = request.getParameter("imdb");
        
//        System.out.println(movieTitle);
//        System.out.println(movieGenre);
//        System.out.println(moviePoster);
//        System.out.println(imdbId);
        
        userId = (Integer) request.getSession().getAttribute("id");
        
        movieTitle = movieTitle.trim();
        
        Connection conn = new DBControl().connectDB();
        try {
            Statement stmt = conn.createStatement();
            
            String query = "INSERT INTO ownership (userId, movieTitle, movieGenre, moviePoster, "
                    + "imdbId, sharedName) VALUES (\"" + userId + "\", \"" + movieTitle 
                    + "\", \"" + movieGenre + "\", \"" + moviePoster + "\", \"" + imdbId
                    + "\", \"" + nameShared + "\");";
            stmt.executeUpdate(query);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("additionComplete", true);
        request.getRequestDispatcher("PopularMovies").forward(request, response);
        //response.sendRedirect("PopularMovies");
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
