<%-- 
    Document   : login.jsp
    Created on : Mar 24, 2015, 3:42:46 PM
    Author     : Paul
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
        <title>Login | jFlix</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href='css/jFlix.css' type='text/css' rel='stylesheet'>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <div class="container">
            <div class="col-md-4 col-md-offset-4">
                <h1 class="page-title">Login</h1>
                <form action="Login" method="POST" name="userLogin">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Username:</label>
                            <input type="text" class="form-control" id="username" name="username" required data-validation-required-message="Please enter your username." autofocus>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="text-center" id="success">
                        <p>${message}</p>
                    </div>
                    <!-- For success/fail messages -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-default">Login</button>
                    </div>
                </form>
                <p class="register-here text-center">Don't have an account?<br>
                   Create one <a href="register.jsp">HERE</a></p>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
