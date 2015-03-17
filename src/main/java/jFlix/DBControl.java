/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFlix;

import static jFlix.Login.DB_URL;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Gil
 */
public class DBControl {
    
     static final String DB_URL = "jdbc:mysql://localhost/jFlix";
       //root ""
       static final String DB_URL2 = "jdbc:mysql://" + System.getenv("OPENSHIFT_MYSQL_DB_HOST") + ":" +
               System.getenv("OPENSHIFT_MYSQL_DB_PORT")+ "/jFlix";
       //java "java-pass 
    
    public Connection connectDB() {
        Connection conn = null;
        Statement stmt = null;
        boolean message = false;
        
        String DB;
        String dbUser;
        String dbPswd;
        
        if (System.getenv("OPENSHIFT_MYSQL_DB_HOST") == null) {            
            DB = DB_URL;
            dbUser = "root";
            dbPswd = "";
        }
        else {
            DB = DB_URL2;
        dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        dbPswd = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        }
        
//        PrintWriter out = response.getWriter();
        

        try {
            
            //creates the driver for connecting
            Class.forName("com.mysql.jdbc.Driver");
            
            
            conn = DriverManager.getConnection(DB, dbUser, dbPswd);

        }
        catch (Exception e) {
            System.out.println("ERROR");
        }
        
        return conn;
    }
}
