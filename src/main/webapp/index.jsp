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
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href='css/jFlix.css' type='text/css' rel='stylesheet'>
        <style>
            body {
                background-color: #c20202;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class='col-md-12 text-center'>
                <img src="images/logo.png" alt='logo' class='home-logo'>
                <a class='btn-home' href='login.jsp'>Sign In</a>
                <a class='btn-home' href='register.jsp'>Register</a>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
