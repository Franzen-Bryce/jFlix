<%-- 
    Document   : index
    Created on : Mar 10, 2015, 3:42:46 PM
    Author     : Bryce
--%>
<%
//  if (${sessionscope.user} != null)
    
    //java preload handler
    /*
    java web preload handler
    run code before each request
    Interceptor --> has methods that help me out
    
    */
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>jFlix</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href='css/jFlix.css' type='text/css' rel='stylesheet'>
    </head>
    <body>
        <div class='row text-center home-1 no-side-margin'>
            <img src="images/logo.png" alt='logo' class='home-logo'>
            <a class='btn-home' href='login.jsp'>Sign In</a>
            <a class='btn-home' href='register.jsp'>Register</a>
        </div>
        <div class="row text-center home-2">
            <div class="col-md-4">
                <h1>A revolutionary step towards managing your movie collection <span class='starts-here lobster'>starts here!</span></h1>
            </div>
            <div class="col-md-8">
                <img class="img-responsive" src="images/screenExample.png" alt="Collection Screen"/>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
