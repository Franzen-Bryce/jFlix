<%-- 
    Document   : add_movie
    Created on : Mar 10, 2015, 3:16:01 PM
    Author     : Bryce
--%>
<%
if(null == session.getAttribute("username")){  
  response.sendRedirect("index.jsp");
}
request.getSession().setAttribute("page", "collection");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <title>My Collection</title>
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href='css/jFlix.css' type='text/css' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <div class="container">
            <h1 class='page-title'>Collection</h1>
            <div class="row">
                <div class="col-md-5">
                    <h1 style="margin-top: 0px; margin-bottom: 20px;">My Collection</h1>
                </div>
                <div class="col-md-2">
                    <form action="SortCollection?genres=${genres}" method="POST" name="sortGenre">
                        <div class="control-group form-group">
                            <select class="form-control" name="sortGenre" onchange="this.form.submit();">
                                <option value="NULL">Sort</option>
                                <option vale="Shared">Shared</option>
                                <c:forEach items="${genres}" var="genre">
                                    <option value="${genre}">${genre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="col-md-5">
                    <form action="SearchCollection?genres=${genres}" method="POST">
                        <div class="control-group form-group">
                            <div class="input-group">
                                <input type="text" class="form-control" name="search" id="search" placeholder="e.g. Movie Title"/>
                                <span class="input-group-btn">
                                  <button class="btn btn-primary" type="submit">Search Collection</button>
                                </span> 
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <c:forEach items="${ownedMovies}" var="Option">
                <div class="movieContainerOuter">
                    <div class='movieContainerInner'>
                        <a href='SingleMovie?imdbID=${Option.imdbID}&collection=true&shared=${Option.shared}'>
                            <c:if test="${Option.Poster == 'N/A'}">
                                <!--Need to use the shared variable in Option to-->
                                <!--Make the little corner lent appear-->
                                <img class='movieImg' src='http://www.vernellbrownjr.com/SorryNoImageAvailable.jpg' alt='${Option.Title}' title='${Option.Title}'/>
                                
                            </c:if>
                            <c:if test="${Option.Poster != 'N/A'}">
                                <img class='movieImg' src='${Option.Poster}' alt='${Option.Title}' title='${Option.Title}'/>
                            </c:if>
                            <c:if test="${Option.shared == true}">
                                <div class="sharedBanner">
                                    <span>Shared</span>
                                </div>
                                <div class="sharedName">
                                    <span style="float: left; width: 139px; padding: 2px 10px; text-align: left;">${Option.sharedName}</span>
                                    <span style="float: right; margin-right: 5px; width: 60px;">
                                        <form action="ShareMovie?imdb=${Option.imdbID}" method="POST">
                                         <button style="padding: 2px 5px; background-color: #660000;" type="submit" name="button" value="return" class="btn btn-primary" style="width: 100%; height: 60px">Return</button>
                                     </form>
                                    </span>
                                </div>
                            </c:if>
                        </a>
                    </div>
                    <p class="movieTitle">${Option.Title}</p>
                </div>
            </c:forEach>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
