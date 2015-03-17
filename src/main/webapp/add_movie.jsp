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
                var loading = $('#loading').html();
                if (loading !== '<span class="glyphicon glyphicon-repeat glyphicon-repeat-animate"></span> Loading...'){
                    $('#loading').html('<span class="glyphicon glyphicon-repeat glyphicon-repeat-animate"></span> Loading...');
                }
                if ($('#search').val) {
                     typingTimer = setTimeout(function(){ 
                        var value = $("#search").val();
                          $.get('Search',{search:value},function(data) { 
                                $('#loading').html("");
                                if (data === "null"){
                                    $('#out').text("No Results Found");
                                }
                                else {
                                //for string information
//                                  $('#out').html(data);
                                  
                                //for json information
                                    var arr = JSON.parse(data);
                                    var i;
                                    var out = "";
                                    var posterImg = "";
                                    for(i = 0; i < arr.length; i++) {
                                        if (arr[i].Poster === "N/A"){
                                            posterImg = "";
//                                            posterImg = "http://3.bp.blogspot.com/-7ziyoiZu3uo/UlEp5zOR3BI/AAAAAAAAAfU/MhA6cwGGy7E/s1600/Poster+Not+Available+png.png";
                                        }
                                        else {
                                            posterImg = arr[i].Poster;
                                        }
                                        out += "<div class='movieContainer'><a href='SingleMovie?imdbID=" + arr[i].imdbID + "'><img class='movieImg' src='" + posterImg + "' alt='" + arr[i].Title + "' title='" + arr[i].Title + "'/></a></div>";
                                    }
                                    $('#out').html(out);
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
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1 style="margin-top: 0px;">Search Movies / Add to Your Collection</h1>
                </div>
                <div class="control-group form-group col-md-4">
                    <div class="controls">
                        <input type="text" autofocus class="form-control" name="search" onkeyup="search()" id="search" placeholder="Search">
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="loading" class="col-md-12" style="text-align: center; font-size: 14pt; height: 20px;"></div>
                <div class="col-md-12">
                    <div id="out" style="padding-top: 20px;">
                        <!--content goes here-->
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
