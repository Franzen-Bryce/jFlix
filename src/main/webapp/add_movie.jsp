<%-- 
    Document   : add_movie
    Created on : Mar 10, 2015, 3:16:01 PM
    Author     : Bryce
--%>
<%
if(null == session.getAttribute("username")){  
  response.sendRedirect("index.jsp");
}
request.getSession().setAttribute("page", "add_movie");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Movie</title>
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-8">
                    <h1 style="margin-top: 0px;">Search Movies / Add to Your Collection</h1>
                </div>
                <div class="col-md-4 col-lg-4">
                    <form action="Search" method="POST">
                        <div class="control-group form-group">
                            <div class="input-group">
                                <input type="text" autofocus class="form-control" name="search" id="search" placeholder="e.g. Movie Title">
                                <span class="input-group-btn">
                                  <button class="btn btn-primary" type="submit">Search</button>
                                </span> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <c:if test="${search == 'No Results'}">
                        <h3 style="text-align: center;">No Results Found</h3>
                    </c:if>
                    <c:if test="${search != 'No Results'}">
                        <c:forEach items="${search}" var="movie">
                            <div class="movieContainerOuter">
                                <div class='movieContainerInner'>
                                    <a href='SingleMovie?imdbID=${movie.imdbID}'>
                                        <c:if test="${movie.Poster == 'N/A'}">
                                            <img class='movieImg' src='http://www.vernellbrownjr.com/SorryNoImageAvailable.jpg' alt='${movie.Title}' title='${movie.Title}'/>

                                        </c:if>
                                        <c:if test="${movie.Poster != 'N/A'}">
                                            <img class='movieImg' src='${movie.url}' alt='${movie.Title}' title='${movie.Title}'/>
                                        </c:if>
                                    </a>
                                </div>
                                <p class="movieTitle">${movie.Title}</p>
                            </div>
                        </c:forEach>
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
