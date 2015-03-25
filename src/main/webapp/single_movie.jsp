<%-- 
    Document   : single_movie
    Created on : Mar 16, 2015, 11:38:25 PM
    Author     : Bryce
--%>
<%
if(null == session.getAttribute("username")){  
  response.sendRedirect("index.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <title>${movie.Title}</title>
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href='css/jFlix.css' type='text/css' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <a href="javascript:history.back()">
            <div class="backButton">
                <div class="container">
                    <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
                    <c:if test="${collection == 'true'}">
                        <span>Back to Collection</span>
                    </c:if>
                    <c:if test="${collection != 'true'}">
                        <span>Back to Search Results</span>
                    </c:if>
                </div>
            </div>
        </a>
        <div class="container">
            <!-- Modal For Trailer-->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-body">
<!--                      <button type="button" style="display: inline-block; float: right;" class="btn btn-danger" data-dismiss="modal">Close</button>-->
                    <iframe width="854" height="510" src="https://www.youtube.com/embed/${trailerId}?rel=0" frameborder="0" allowfullscreen></iframe>
<!--                  </div>
                  <div class="modal-footer">-->
                  </div>
                </div>
              </div>
            </div>
            <!-- End Modal For Trailer-->
            <div class="row">
                <div class="col-md-3" style="padding-top: 20px;">
                    <div class="singlePosterImage">
                        <img class="img-responsive" src="${Poster}" alt="${movie.Title}"/>
                        <span id="movieTrailer" data-toggle="modal" data-target="#myModal" class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="padding-top: 10px">
                             <c:if test="${collection == 'true'}">
                                <br>
                                <form action="ShareMovie?imdb=${movie.imdbID}" method="POST">
                                <button type="submit" class="btn btn-primary" style="width: 100%; height: 60px">Checkout to Friend&nbsp;&nbsp;<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></button>
                                </form><br>
                                <form action="RemoveMovie?imdb=${movie.imdbID}" method="POST">
                                <button type="submit" class="btn btn-success" style="width: 100%; height: 50px"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;Remove From Collection</button>
                                </form>
                            </c:if>
                            <c:if test="${collection != 'true'}">
                                <form action="AddMovie?poster=${Poster}&Title=${movie.Title}
                                  &genre=${movie.Genre}&imdb=${movie.imdbID}" method="POST">
                                <button type="submit" class="btn btn-primary" style="width: 100%; height: 60px"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>&nbsp;&nbsp;Add To My Collection</button>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>${movie.Title} (${movie.Year})</h2>
                        </div>
                    </div>
                    <div class="row" style="background-color: #d2d2d2; padding: 20px 0px;">
                        <div class="col-md-3">
                            <b>IMDB User Rating:</b> ${movie.imdbRating}
                        </div>
                        <div class="col-md-5">
                            <b>Genre:</b> ${movie.Genre}
                        </div>
                        <div class="col-md-4">
                            <b>Maturity Rating:</b> ${movie.Rated}
                        </div>
                    </div>
                    <div class="row" style="padding-bottom: 20px;">
                        <div class="col-md-12">
                            <h3>Plot:</h3>
                            <p>${movie.Plot}</p>
                        </div>
                        <div class="col-md-12">
                            <h3>Actors:</h3>
                            <p>${movie.Actors}</p>
                        </div>
                    </div>
                    <div class="row" style="background-color: #d2d2d2; padding: 20px 0px;">
                        <div class="col-md-3">
                            <b>Director:</b><br>
                            <p>${movie.Director}</p>
                        </div>
                        <div class="col-md-5">
                            <b>Writer:</b><br>
                            <p>${movie.Writer}</p>
                        </div>
                        <div class="col-md-4">
                            <b>Awards:</b><br>
                            <p>${movie.Awards}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
