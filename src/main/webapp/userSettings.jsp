<%-- 
    Document   : add_movie
    Created on : Mar 10, 2015, 3:16:01 PM
    Author     : Bryce
--%>
<%
if(null == session.getAttribute("username")){  
  response.sendRedirect("index.jsp");
}
request.getSession().setAttribute("page", "settings");
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
            <div class="col-md-5">
                <h1>User Settings:</h1>
                <form action="Register" method="POST" name="userRegister">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Display Name:</label>
                            <input type="text" class="form-control" id="displayName" name="displayName" value="${sessionScope.displayname}" required>
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-default">Update Your Display Name</button>
                </form><br><br>
                <form action="UserSettings" method="POST" name="userPassword">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>New Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required data-validation-required-message="Please enter your password.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Confirm New Password:</label>
                            <input type="password" class="form-control" id="password2" name="password2" required data-validation-required-message="Please confirm your password.">
                        </div>
                    </div>
                    <div id="success"></div>
                    <!-- For success/fail messages -->
                    <button type="submit" class="btn btn-default">Update Your Account Password</button>
                </form><br>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
