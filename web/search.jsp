<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Search Page</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/2.1.6/jquery.cycle2.min.js"></script>

        <!-- Loading main css file -->
        <link rel="stylesheet" href="style.css">

        <!--[if lt IE 9]>
        <script src="js/ie-support/html5.js"></script>
        <script src="js/ie-support/respond.js"></script>
        <![endif]-->

        <style>
            .login{
                background-color: #FFD700;
                padding: 10px 0;
                border-radius: 5px;
                border-right: 0px;
                color: black;
            }
            #find{
                background-color: #cccccc;
            }
        </style>
    </head>


    <body>


        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <jsp:include page="header/header.jsp"/>
            <main class="main-content">
                <div class="container">
                    <div class="row">
                        <%
                            ArrayList<Movie> lm = (ArrayList<Movie>) request.getAttribute("listMovie");
                            String img, nameMovie;
                            int id;
                            for (Movie mv : lm) {
                                id = mv.getNo();
                                img = mv.getUrl();
                                nameMovie = mv.getName();
                        %>
                        <div class="col-sm-6 col-md-3">
                            <div class="latest-movie" style="margin-bottom: 10px">
                                <a href="PageIntroduce?param=<%=id%>"><img src="<%=img%>" alt="Movie 3" style="height: 350px    ;"></a>
                            </div>
                            <div style="display: flex; justify-content: center; align-content: center;margin-bottom: 30px;font-size: 20px;text-align: center">
                                <a href="PageIntroduce?param=<%=id%>"><p class="name"><b><%=nameMovie%></b></p></a>
                            </div>
                        </div>
                        <%                        }
                        %>

                    </div>
                </div>
            </main>
            <jsp:include page="header/footer.jsp"/>
        </div>
        <!-- Default snippet for navigation -->



        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
    </body>

</html>