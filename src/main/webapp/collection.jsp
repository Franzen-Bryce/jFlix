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
            <h1>My Collection</h1>
            <c:forEach items="${ownedMovies}" var="Option">
                <div class="movieContainerOuter">
                    <div class='movieContainerInner'>
                        <a href='SingleMovie?imdbID=${Option.imdbID}&collection=true'>
                            <c:if test="${Option.Poster == 'N/A'}">
                                <img class='movieImg' src='http://www.vernellbrownjr.com/SorryNoImageAvailable.jpg' alt='${Option.Title}' title='${Option.Title}'/>
                                
                            </c:if>
                            <c:if test="${Option.Poster != 'N/A'}">
                                <img class='movieImg' src='${Option.Poster}' alt='${Option.Title}' title='${Option.Title}'/>
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
