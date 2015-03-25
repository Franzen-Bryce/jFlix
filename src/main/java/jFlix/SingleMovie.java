/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jFlix;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bryce
 */
@WebServlet(name = "SingleMovie", urlPatterns = {"/SingleMovie"})
public class SingleMovie extends HttpServlet {

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
        
        String imdbID = request.getParameter("imdbID");
        
        URL url = new URL("http://www.omdbapi.com/?i=" + imdbID + "&plot=full");
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(url, Map.class);
        
//      GET Movie Info for Youtube
        String title = "";
        String year = "";
              Map<String, Object> innerMap = (Map<String, Object>)map;
              for (String key : innerMap.keySet())
              {
                  if (key.equals("Title")){
                      title = innerMap.get(key).toString();
                  }
                  if (key.equals("Year")){
                      year = innerMap.get(key).toString();
                  }
              }
              
              
               URL url1337 = new URL("http://api.themoviedb.org/3/find/" + imdbID 
                        + "?api_key=ee5b93a565655155882df541850c7364&external_source=imdb_id");
                ObjectMapper mapper1337 = new ObjectMapper();
                Map<String, Object> map1337 = mapper1337.readValue(url1337, Map.class);
                List<Object> movieResults = (List) map1337.get("movie_results");
                
                for (Object temp : movieResults) {
                    Map<String, String> singleMovie = (Map) temp;
                    String poster = "http://image.tmdb.org/t/p/w300";
                    poster += singleMovie.get("poster_path");
                    request.setAttribute("Poster", poster);
                }
        
        title = title.trim();
        title = title.replace(" ", "-");
        
        // GET MOVIE Youtube ID
        URL url2 = new URL("http://gdata.youtube.com/feeds/api/videos?q=" + title + "official-movie-trailer-" + year + "-english&start-index=1&max-results=1&v=2&alt=json&hd");
  
        ObjectMapper mapper2 = new ObjectMapper();
        
        Map<String, Object> map2 = mapper2.readValue(url2, Map.class);
        
        // GET MOVIE ID
        String trailerId = "";
        
        Map<String, Object> map3 = (Map)map2.get("feed");
        ArrayList movieEntry = (ArrayList)map3.get("entry");
        
        for (Object item : movieEntry)
        {
              Map<String, Object> innerMap2 = (Map<String, Object>)item;
              for (String key : innerMap2.keySet())
              {
                  if (key.equals("media$group")){
                        Map<String, Object> temp = (Map) innerMap2.get(key);
                        Map<String, String> temp2 = (Map) temp.get("yt$videoid");
                        trailerId = temp2.get("$t");
                    }
              }
          }
              
        request.setAttribute("trailerId", trailerId);
        request.setAttribute("movie", map);
        
        if (request.getParameter("collection").equals("true"))
            request.setAttribute("collection", "true");
        else
            request.setAttribute("collection", "false");
        request.getRequestDispatcher("single_movie.jsp").forward(request, response);
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
