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
        <style>
            .div2 {
                position: relative;
                z-index: 50;
            }
            .div2 img {
                position: relative;
                z-index: 0;
            }
            .div3{
                position: relative;
                z-index: 100;
            }
            .div4{
                position: relative;
                z-index: 150;
            }
            .div5 {
                position: relative;
                z-index: 200;
            }
        </style>
    </head>
    <body>
        <div class='row text-center home-top no-margin'>
            <img src="images/logo.png" alt='logo' class='home-logo'>
            <a class='btn-home' href='login.jsp'>Sign In</a>
            <a class='btn-home' href='register.jsp'>Register</a>
        </div>
        <div class="row text-center home-1 no-margin">
            <div class="col-md-5">
                <h1>A revolutionary step towards managing your movie collection <span class='starts-here lobster'>starts here!</span></h1>
                <ul class="home-ul">
                    <li>Add movies to your personal collection</li>
                    <li>Filter your collection by Genre, Title, or Shared Status</li>
                </ul>
            </div>
            <div class="col-md-7">
                <img class="img-responsive" src="images/collection.png" alt="Collection Screen"/>
            </div>
        </div>
        <div class="row text-center home-2 no-margin div2">
            <div class="col-md-7">
                <img class="img-responsive" src="images/screenExample.png" alt="Full Movie Details"/>
            </div>
            <div class="col-md-5">
                <h1><span class='lobster'>Full Movie Details</span></h1>
                <ul class="home-ul">
                    <li>See the details of an individual movie</li>
                    <li>Includes awards, actors, movie rating and more</li>
                </ul>
            </div>
        </div>
        <div class="row text-center home-1 no-margin div3">
            <div class="col-md-5">
                <h1><span class='starts-here lobster'>Full Feature Search and Popular Film Suggestions</span></h1>
                <ul class="home-ul">
                    <li>See what movies are popular without having to search</li>
                    <li>Search for your favorite movies and add them to your collection</li>
                </ul>
            </div>
            <div class="col-md-7">
                <img class="img-responsive" src="images/searchAndSuggestedMovies.png" alt="Search and Suggested Films"/>
            </div>
        </div>
        <div class="row text-center home-2 no-margin div4">
            <div class="col-md-7">
                <img class="img-responsive" src="images/movieTrailer.png" alt="Movie Trailers"/>
            </div>
            <div class="col-md-5">
                <h1><span class='lobster'>On-Demand Trailers</span></h1>
                <ul class="home-ul">
                    <li>Think the poster of a movie is interesting?</li>
                    <li>Watch the trailer right here and now to see if you will enjoy it</li>
                </ul>
            </div>
        </div>
        <div class="row text-center home-1 no-margin div5">
            <div class="col-md-5">
                <h1><span class='starts-here lobster'>Lend Movies With Ease</span></h1>
                <ul class="home-ul">
                    <li>Did your friend or neighbor borrow a movie?</li>
                    <li>Keep record of it here to know who has what movie</li>
                </ul>
            </div>
            <div class="col-md-7">
                <img class="img-responsive" src="images/filterResults.png" alt="Lend Movies With Ease"/>
            </div>
        </div>
        <div class="row text-center home-2 no-margin div6">
            <div class="col-md-7">
                <img class="img-responsive" style="box-shadow: none;" src="images/APIS.png" alt="API Image"/>
            </div>
            <div class="col-md-5">
                <h1><span class='lobster'>Multiple API's To Provide Loads of Information</span></h1>
                <ul class="home-ul">
                    <li>We have used multiple technologies to provide easy access for you</li>
                    <li>This allows us to be up to date with data and posters</li>
                </ul>
            </div>
        </div>
        <footer>
            <%@include file="/modules/footer.html"%>
        </footer>
    </body>
</html>
