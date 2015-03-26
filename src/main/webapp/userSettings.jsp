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
        <script>
            function checkDeleteValue(){
                var text = document.getElementById("deleteConfirm").value;
                var username = "${sessionScope['username']}";
                
                if (text === "Yes. Delete " + username){
                    $("#deleteConfirmButton").removeAttr("disabled");
                    $("#deleteConfirmButton").removeClass().addClass("btn btn-primary userSettingsButton");
                }
                else {
                    $("#deleteConfirmButton").attr("disabled", true);
                    $("#deleteConfirmButton").removeClass().addClass("btn btn-default userSettingsButton");
                }
            }
        </script>
    </head>
    <body>
        <header>
            <%@include file="/modules/nav.html"%>
        </header>
        <div class="container">
            <row>
                <div class='col-md-12'>
                    <h1>User Settings: ${sessionScope.username}</h1>
                    <br>
                </div>
            </row>
            <row>
                <div class='col-md-12 text-center' style='background-color: #c20202; color: #fff; border-radius: 5px;'>
                    ${sessionScope.message}
                </div>
            </row>
            <row>
                <div class="col-md-5">
                    <h2>Display Name</h2>
                    <form action="UserSettings" method="POST">
                        <div class="control-group form-group">
                            <label>Display Name:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="displayName" name="displayName" value="${sessionScope.displayname}" required>
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary userSettingsButton">Update Name</button>
                                </span>
                            </div>
                        </div>
                        <input type="hidden" name="form" value="Name"/>
                    </form><br><br>
                </div>
                <div class='col-md-2'></div>
                <div class='col-md-5'>
                    <h2>Password</h2>
                    <form action="UserSettings" method="POST">
                        <div class="control-group form-group">
                            <div class="controls">
                                <label>New Password:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                        </div>
                        <div class="control-group form-group">
                            <label>Confirm New Password:</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password2" name="password2" required>
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary userSettingsButton">Update Password</button>
                                </span>
                            </div>
                        </div>
                        <input type="hidden" name="form" value="Password"/>
                    </form><br>
                </div>
            </row>
            <row>
                <div class='col-md-12'>
                    <br><hr style='height: 1px; background-color: #c20202'>
                    <h2>Delete User Account</h2>
                    <form action="UserSettings" method="POST">
                        <div class="control-group form-group">
                            <label>Confirm account deletion by typing, "<span style='color: #c20202'>Yes. Delete ${sessionScope.username}</span>"</label>
                            <div class="input-group">
                                <input type="text" onkeyup="checkDeleteValue()" class="form-control" id="deleteConfirm" name="deleteConfirm" required placeholder='This action is permanent and cannot be reversed'>
                                <span class="input-group-btn">
                                    <button type="submit" id="deleteConfirmButton" class="btn btn-default userSettingsButton" disabled>Permanently Remove My Account</button>
                                </span>
                            </div>
                        </div>
                        <input type="hidden" name="form" value="Permanently Remove"/>
                    </form><br>
                </div>
            </row>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
<%request.getSession().removeAttribute("message");%>
