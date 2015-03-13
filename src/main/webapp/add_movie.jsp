<%-- 
    Document   : add_movie
    Created on : Mar 10, 2015, 3:16:01 PM
    Author     : Bryce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Movie</title>
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
            //setup before functions
             var typingTimer;                //timer identifier
             var doneTypingInterval = 1000;  //time in ms, 1 second for example

             //on keyup, start the countdown
             function search(){
             $('#search').keyup(function(){
                 clearTimeout(typingTimer);
                 if ($('#search').val) {
                     typingTimer = setTimeout(function(){ 
                        var value = $("#search").val();
                          $.get('Search',{search:value},function(data) { 
                                if (data === "null"){
                                    $('#out').text("No Results Found");
                                }
                                else {
                                    $('#out').text(data);
                                } 
                            });
                     }, doneTypingInterval);
                 }
             });
         }
        </script>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <div class="container" style="padding-top: 20px;">
            <div class="col-md-8">
                <h1 style="margin-top: 0px;">Search Movies / Add to Your Collection</h1>
                <div id="out"></div>
            </div>
            <div class="control-group form-group col-md-4">
                <div class="controls">
                    <input type="text" class="form-control" name="search" onkeyup="search()" id="search" placeholder="Search">
                </div>
            </div>
            <c:forEach items="${movieList}" var="movie">
                <div class="movie">
                    <img src="" alt=""/>
                    <a href="SingleMovie?id=${movie.imdbID}">${movie.Title} (${movie.Year})</a><br>
                </div>
            </c:forEach>
            <div id="out"></div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
