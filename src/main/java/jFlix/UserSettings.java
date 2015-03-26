/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFlix;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import static jFlix.Register.md5;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
@WebServlet(name = "UserSettings", urlPatterns = {"/UserSettings"})
public class UserSettings extends HttpServlet {

    public static String md5(String input) {
        String md5 = null;
        if(null == input) return null;
        try {
            //Create MessageDigest object for MD5
            MessageDigest digest = MessageDigest.getInstance("MD5");
            //Update input string in message digest
            digest.update(input.getBytes(), 0, input.length());
            //Converts message digest value in base 16 (hex) 
            md5 = new BigInteger(1, digest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
        }
        return md5;
    }
    
    
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
        
        int userId = (Integer) request.getSession().getAttribute("id");
        
        //Change Display Name
        if (request.getParameter("form").equals("Name")){
            String displayName = request.getParameter("displayName");
            
            //update display name in database
            Connection conn = new DBControl().connectDB();
            try {
                Statement stmt = conn.createStatement();

                String query = "UPDATE user SET displayname='"+ displayName + "' WHERE id='" + userId + "'";
                stmt.executeUpdate(query);
                
                request.getSession().setAttribute("displayname", displayName);
            } 
            catch (SQLException ex) {
                Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("userSettings.jsp");
        }
        
        //Change User Password
        if (request.getParameter("form").equals("Password")){
            String newPassword1 = request.getParameter("password");
            String newPassword2 = request.getParameter("password2");
            
            if (newPassword1.equals(newPassword2)){
                //update password in database
                String hashedPass = md5(newPassword1);
                
                //update password in database
                Connection conn = new DBControl().connectDB();
                try {
                    Statement stmt = conn.createStatement();

                    String query = "UPDATE user SET password='"+ hashedPass + "' WHERE id='" + userId + "'";
                    stmt.executeUpdate(query);
                } 
                catch (SQLException ex) {
                    Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            response.sendRedirect("userSettings.jsp");
        }
        
        //Delete User From Database
        if (request.getParameter("form").equals("Permanently Remove")){
            
            String checkDelete = request.getParameter("deleteConfirm");
            
            //double check correct statement was entered
            if (checkDelete.equals("Yes. Delete " + request.getSession().getAttribute("username"))){
            
                Connection conn = new DBControl().connectDB();
                try {
                    Statement stmt = conn.createStatement();

                    String query = "DELETE FROM user WHERE id='" + userId + "'";
                    stmt.executeUpdate(query);
                    
                    request.getSession().removeAttribute("username");
                    request.getSession().removeAttribute("displayname");
                    request.getSession().removeAttribute("id");
                
                    response.sendRedirect("index.jsp");
                } 
                catch (SQLException ex) {
                    Logger.getLogger(AddMovie.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("userSettings.jsp");
                }
            }
            else {
                response.sendRedirect("userSettings.jsp");
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
