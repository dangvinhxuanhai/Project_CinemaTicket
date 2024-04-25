<%@page import="model.Category"%>
<%@page import="model.Movie"%>
<%@page import="model.MovieManager"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Introduce Page</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Loading main css file -->
        <link rel="stylesheet" href="style.css">

        <!--[if lt IE 9]>
        <script src="js/ie-support/html5.js"></script>
        <script src="js/ie-support/respond.js"></script>
        <![endif]-->
    </head>


    <body>


        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <jsp:include page="header/header.jsp"/>
            <%
                String param = request.getParameter("param");
                int id = Integer.parseInt(param);
                MovieManager mm = new MovieManager();
                Movie mv = mm.getMovieById(id);
                int no = mv.getNo();
                int lenght = mv.getLenght();
                String name = mv.getName();
                String url = mv.getUrl();
                String introduce = mv.getIntroduce();
                String actor = mv.getActor();
                String premiere = mv.getPremiere();
                String Category1 = mv.getCategory1().getName();
                String Category2 = mv.getCategory2().getName();
                String Directors = mv.getDirectors();
            %>
            <main class="main-content" style="padding-top: 70px">
                <div class="container">
                    <div class="page">
                        <div class="breadcrumbs">
                            <a href="index.jsp">Home</a>
                            <span>Introduce <%=name%></span>
                        </div>


                        <div class="content">
                            <div class="row">
                                <div class="col-md-6" ">
                                    <figure class="movie-poster"  "><img src="<%=url%>" alt="#" style="height: 800px; width: 600px;"></figure>
                                </div>
                                <div class="col-md-6">
                                    <h2 class="movie-title"><%=name%></h2>
                                    <div class="movie-summary">
                                        <p><%=introduce%></p>

                                    </div>
                                    <ul class="movie-meta">
                                        <li><strong>Rating:</strong> 
                                            <div class="star-rating" title="Rated 4.00 out of 5"><span style="width:80%"><strong class="rating">4.00</strong> out of 5</span></div>
                                        </li>
                                        <li><strong>Length:</strong> <%=lenght%> min</li>
                                        <li><strong>Premiere:</strong> <%=premiere%></li>
                                        <li><strong>Category:</strong> <%=Category1%>/<%=Category2%></li>
                                    </ul>

                                    <ul class="starring">
                                        <li><strong>Directors:</strong> <%=Directors%></li>                                       
                                        <li><strong>Stars:</strong> <%=actor%></li>
                                    </ul>
                                    <!--Test tam thoi !!!!!!!!!!!!!!-->
                                    <a href="PageSchedule">
                                        <button type="button" style="margin-left: 200px; height: 40px; ">Book Tickets</button>
                                    </a>
                                    <!--Test tam thoi !!!!!!!!!!!!!!--> 
                                       
                                </div>
                            </div> <!-- .row -->
                        </div>
                    </div>
                </div> <!-- .container -->
            </main>
            <jsp:include page="header/footer.jsp"/>
        </div>
        <!-- Default snippet for navigation -->



        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>

    </body>

</html>