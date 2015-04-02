/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFlix;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Bryce
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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
        
            String username = request.getParameter("username");
            String displayname = request.getParameter("displayName");
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");
            
            username = username.toLowerCase();


            boolean message = false;
            if (!(password.equals(password2))){
                //passwords dont match, set error
               request.setAttribute("passwordError", "Either username or password incorrect.");

               message = true;
            }


            boolean exists = new DBControl().checkUser(username);//get current username from database
            if(exists){
                //username already exists, set error
                request.setAttribute("usernameError", "Either username or password incorrect.");
                message = true;
            }


            if(message){
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else {
                try {
                    //no errors, creates user and logs them in

                    String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

                    request.setAttribute("username", username);
                    request.setAttribute("displayname", displayname);

                    //comment to test jenkins build
                    Connection conn;
                    Statement stmt;

                    
                    conn = new DBControl().connectDB();

                    //query from the database all information from the user table
                    String query = "INSERT INTO user (username, displayname, password) VALUES (\"" + username 
                            + "\", \"" + displayname + "\", \"" + hashed + "\");";
                    //CREATE A SESSION FOR USER
                    stmt = conn.createStatement();

//                    System.out.println(query);
                    //executes the query and saves it into a ResultSet
                    stmt.executeUpdate(query);
                }
                catch(Exception e) {
                    
                }
                request.getRequestDispatcher("Login").forward(request, response);
            }
    }
    
//    
//    // Hash a password for the first time
//String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
//
//// gensalt's log_rounds parameter determines the complexity
//// the work factor is 2**log_rounds, and the default is 10
//String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
//
//// Check that an unencrypted password matches one that has
//// previously been hashed
//if (BCrypt.checkpw(candidate, hashed))
//	System.out.println("It matches");
//else
//	System.out.println("It does not match");
    
    
    
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
