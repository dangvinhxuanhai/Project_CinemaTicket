<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MovieManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>TTH Cinema</title>

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
            .part2{
                width: 900px;

            }
            .boxPart2{
                display: flex;
                justify-content: center;
                align-content: center;
            }
            .main-content{
                background-image: url("dummy/background1.jpg");
            }
        </style>
    </head>
    <body>
        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <jsp:include page="header/header.jsp"/>
            <main class="main-content">
                <div class="page" style="width: 100%;display: flex; justify-content: center; align-content: center; padding-top: 70px">
                    <div style="width: 1200px; ">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="slider">
                                    <ul class="slides">
                                        <%
                                            MovieManager mm = new MovieManager();
                                            ArrayList<Movie> listMovie = mm.getList();
                                            Movie mv;
                                            for (int i = 0; i < 3; i++) {
                                                mv = listMovie.get(i);
                                        %>
                                        <li><a href="PageIntroduce?param=<%=mv.getNo()%>"><img src="<%=mv.getUrl2()%>" alt="<%=mv.getName()%>" style="height: 550px;"></a></li>
                                                <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- .row -->
                        <div  class="col-sm-12 text-center" style="display: flex; justify-content: center;margin-top: 40px;margin-bottom:  30px; color: #ff3333;   font-size: 35px">
                            <strong >TOP TIER MOVIES</strong>
                        </div>

                        <div class="row">
                            <%
                                int count = 0;
                                for (int i = listMovie.size() - 1; count < 4; i--) {
                                    count++;
                                    mv = listMovie.get(i);
                            %>
                            <div class="col-sm-6 col-md-3">
                                <div class="latest-movie">
                                    <a href="PageIntroduce?param=<%=mv.getNo()%>"><img src="<%=mv.getUrl()%>" alt="Movie 3" style="height: 400px    ;"></a>
                                </div>
                            </div>
                            <%}%>
                        </div> 
                    </div>
                </div>
                <div class="boxPart2" style="background-color: white; width: 100%; margin-top: 50px;padding-bottom: 30px">
                    <div id="currentMovie" class="part2">
                        <div  class="col-sm-12 text-center" style="display: flex; justify-content: center;margin-top: 40px;margin-bottom:  20px;   font-size: 35px">
                            <strong >CURRENT MOVIES</strong>
                        </div>

                        <div class="movie-list" id="movieList">

                            <%
                                for (Movie mve : mm.getList()) {
                            %>
                            <div class="movie" style="margin-bottom: 0px">
                                <figure class="movie-poster"><img src="<%=mve.getUrl()%>" alt="#" style="height: 300px;"></figure>
                                <div class="movie-title" style="display: flex; justify-content: center; align-content: center;font-size: 20px;text-align: center">
                                    <a href="PageIntroduce?param=<%=mve.getNo()%>"><b><%=mve.getName()%></b></a>
                                </div>
                            </div>
                            <%}%>

                        </div> <!-- .movie-list -->

                        <div class="pagination" id="pagination">
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="header/footer.jsp"/>
        </div>
        <!-- Default snippet for navigation -->



        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
        <script>
            $(document).ready(function () {
                $('.slider').cycle({
                    fx: 'fade', // Ch?n hi?u ?ng chuy?n trang (ví d?: fade, scrollHorz, ...)
                    speed: 1000, // T?c ?? chuy?n trang
                    timeout: 5000, // Th?i gian ch? gi?a các chuy?n ??i (??n v?: mili giây)
                    pager: '#slider-pager', // ?i?u h??ng slider
                    pagerTemplate: '<span></span>', // M?u cho ?i?u h??ng slider
                    pauseOnHover: true // T?m d?ng khi rê chu?t vào slider
                });
            });
        </script>
        <script>
            // Số phần tử trên mỗi trang
            const itemsPerPage = 8;

            // Lấy danh sách phim từ server
            const movieList = document.getElementById('movieList');
            const movies = movieList.querySelectorAll('.movie');

            // Tính tổng số trang
            const totalPages = Math.ceil(movies.length / itemsPerPage);

            // Hiển thị phần tử đầu tiên, ẩn các phần tử còn lại
            function showPage(pageNumber) {
                const startIndex = (pageNumber - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;

                movies.forEach((movie, index) => {
                    if (index >= startIndex && index < endIndex) {
                        movie.style.display = 'block';
                    } else {
                        movie.style.display = 'none';
                    }
                });
            }

            // Tạo các liên kết phân trang
            const pagination = document.getElementById('pagination');

            // Liên kết trang trước
            const prevPageLink = document.createElement('a');
            prevPageLink.href = '#currentMovie';
            prevPageLink.classList.add('page-number', 'prev');
            prevPageLink.innerHTML = '<i class="fa fa-angle-left"></i>';
            prevPageLink.addEventListener('click', () => {
                currentPage = Math.max(currentPage - 1, 1);
                showPage(currentPage);
            });
            pagination.appendChild(prevPageLink);

            // Liên kết các trang
            for (let i = 1; i <= totalPages; i++) {
                const pageLink = document.createElement('a');
                pageLink.href = '#currentMovie';
                pageLink.classList.add('page-number');
                pageLink.textContent = i;
                pageLink.addEventListener('click', () => {
                    currentPage = i;
                    showPage(currentPage);
                });
                pagination.appendChild(pageLink);
            }

            // Liên kết trang tiếp theo
            const nextPageLink = document.createElement('a');
            nextPageLink.href = '#currentMovie';
            nextPageLink.classList.add('page-number', 'next');
            nextPageLink.innerHTML = '<i class="fa fa-angle-right"></i>';
            nextPageLink.addEventListener('click', () => {
                currentPage = Math.min(currentPage + 1, totalPages);
                showPage(currentPage);
            });
            pagination.appendChild(nextPageLink);

            // Hiển thị trang đầu tiên ban đầu
            let currentPage = 1;
            showPage(currentPage);
        </script>
    </body>

</html>