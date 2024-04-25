<%@page import="model.ScheduleManager"%>
<%@page import="model.Schedule"%>
<%@page import="model.MaPhongXuatChieu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Movie"%>
<%@page import="model.MovieManager"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Schedule Page</title>

        <!-- Loading main css file -->
        <link rel="stylesheet" href="style.css">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .midContent1{
                display: flex;
                justify-content: center;
            }
            .section-yellow {
                background-color: #f9f6ec;
                padding: 40px 0;
                width: 100%;
            }

            .showtime {
                text-align: center;
                margin-top: 50px;
            }

            .month {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 20px;
            }

            .month strong {
                margin-right: 10px;
            }

            .day-showing-container {
                display: inline-flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                margin-left: 250px;
            }

            .day-showing-item {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                flex-basis: 20%;
                transition: transform 0.3s ease;
            }

            .day-showing-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

            .dayofweek {
                margin-bottom: 10px;
                font-size: 14px;
                font-weight: bold;
            }

            .badge {
                display: block;
                padding: 3px 7px;
                font-size: 12px;
                font-weight: 700;
                line-height: 1;
                color: #fff;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                background-color: #777;
                border-radius: 10px;
            }
            /*--*/
            .movie-time-line-box {
                /*                border: 1px solid #ccc;*/
                padding: 15px;
                margin-bottom: 15px;
            }
            .movie-name {
                margin-bottom: 10px;
            }
            .lot-table {
                display: flex;
                align-items: center;
            }
            .poster_content {
                width: 150px;
                height: 225px;
                overflow: hidden;
                margin-right: 15px;
            }
            .poster_content img {
                width: 100%;
                height: auto;
            }
            .time-slot {
                display: flex;
                align-items: center;
            }
            .time {
                margin-right: 15px;
            }
            .ppnum {
                margin-right: 15px;
            }
            .time-slot{
                border: 1px solid #ccc;
                text-align: center;
            }
            .movie-time-line-box {
                margin-left: 30px
            }
            .section-white{
                /*                margin-left: 500px;*/
            }
            .login{
                background-color: #FFD700;
                padding: 10px 0;
                border-radius: 5px;
                border-right: 0px;
                color: black;
            }
            .active-movie-day {
                color: #FFD700;
            }
            .active-date {
                background-color: #ffeb3b;
                color: #333;
            }
        </style>
    </head>


    <body>


        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <jsp:include page="header/header.jsp"/>
            <%

                ScheduleManager sm = new ScheduleManager();
                ArrayList<Schedule> list = sm.getList();
                ArrayList<Schedule> listT2 = sm.getScheduleByDate("T2");
                ArrayList<Schedule> listT3 = sm.getScheduleByDate("T3");
                ArrayList<Schedule> listT4 = sm.getScheduleByDate("T4");
                ArrayList<Schedule> listT5 = sm.getScheduleByDate("T5");
                ArrayList<Schedule> listT6 = sm.getScheduleByDate("T6");
                ArrayList<Schedule> listT7 = sm.getScheduleByDate("T7");
                ArrayList<Schedule> listCN = sm.getScheduleByDate("CN");


            %>  
            <div class="midContent1" style="padding-top: 70px;">
                <div  class="container">
                    <div>
                        <section class="section-yellow " style="border-radius: 20px">
                            <h2 class="showtime" style="font-size:40px;" >Select Date</h2>
                            <div class="month">
                                <strong id="center-month" style="font-size:30px">March</strong>
                            </div>
                            <ul class="day-showing-container">

                                <li class="day-showing-item available active-date" movie-day-selected="2024-03-13">
                                    <div class="dayofweek">Wednesday</div>
                                    <span class="badge">13</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-14">
                                    <div class="dayofweek">Thursday</div>
                                    <span class="badge">14</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-15">
                                    <div class="dayofweek">Friday</div>
                                    <span class="badge">15</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-16">
                                    <div class="dayofweek">Saturday</div>
                                    <span class="badge">16</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-17">
                                    <div class="dayofweek">Sunday</div>
                                    <span class="badge">17</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-18">
                                    <div class="dayofweek">Monday</div>
                                    <span class="badge">18</span>
                                </li>
                                <li class="day-showing-item available" movie-day-selected="2024-03-19">
                                    <div class="dayofweek">Tuesday</div>
                                    <span class="badge">19</span>
                                </li>
                            </ul>
                        </section> 
                        <div class="contentBot" style="background-color: white; height: 100%;border-radius: 20px; margin-top: 30px">
                            <h3 class="title" style="margin-left: 400px;font-size:40px;padding-top: 15px">Select Showtime</h3>
                            <section class="section-white">
                                <%  Movie movieT4;
                                    String timeSlotT4;
                                    String theaterT4;
                                    ArrayList<MaPhongXuatChieu> listmpT4;
                                    ArrayList<Movie> listMvT4 = sm.getMovieByDate("T4");
                                    
                                    for (Movie mv : listMvT4) {
                                        listmpT4 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT4);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-13">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT4) {
                                                timeSlotT4 = mp.getXuatChieu();
                                                theaterT4 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT4, timeSlotT4,"T4")%>"><%=timeSlotT4%> <br> <%=theaterT4%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieT5;
                                    String timeSlotT5;
                                    String theaterT5;
                                    ArrayList<MaPhongXuatChieu> listmpT5;
                                    ArrayList<Movie> listMvT5 = sm.getMovieByDate("T5");
                                    
                                    for (Movie mv : listMvT5) {
                                        listmpT5 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT5);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-14" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT5) {
                                                timeSlotT5 = mp.getXuatChieu();
                                                theaterT5 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT5, timeSlotT5,"T5")%>"><%=timeSlotT5%> <br> <%=theaterT5%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieT6;
                                    String timeSlotT6;
                                    String theaterT6;
                                    ArrayList<MaPhongXuatChieu> listmpT6;
                                    ArrayList<Movie> listMvT6 = sm.getMovieByDate("T6");
                                    
                                    for (Movie mv : listMvT6) {
                                        listmpT6 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT6);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-15" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT6) {
                                                timeSlotT6 = mp.getXuatChieu();
                                                theaterT6 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT6, timeSlotT6,"T6")%>"><%=timeSlotT6%> <br> <%=theaterT6%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieT7;
                                    String timeSlotT7;
                                    String theaterT7;
                                    ArrayList<MaPhongXuatChieu> listmpT7;
                                    ArrayList<Movie> listMvT7 = sm.getMovieByDate("T7");
                                    
                                    for (Movie mv : listMvT7) {
                                        listmpT7 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT7);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-16" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT7) {
                                                timeSlotT7 = mp.getXuatChieu();
                                                theaterT7 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT7, timeSlotT7,"T7")%>"><%=timeSlotT7%> <br> <%=theaterT7%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieCN;
                                    String timeSlotCN;
                                    String theaterCN;
                                    ArrayList<MaPhongXuatChieu> listmpCN;
                                    ArrayList<Movie> listMvCN = sm.getMovieByDate("CN");
                                    
                                    for (Movie mv : listMvCN) {
                                        listmpCN = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listCN);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-17" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpCN) {
                                                timeSlotCN = mp.getXuatChieu();
                                                theaterCN = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterCN, timeSlotCN,"CN")%>"><%=timeSlotCN%> <br> <%=theaterCN%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieT2;
                                    String timeSlotT2;
                                    String theaterT2;
                                    ArrayList<MaPhongXuatChieu> listmpT2;
                                    ArrayList<Movie> listMvT2 = sm.getMovieByDate("T2");
                                    
                                    for (Movie mv : listMvT2) {
                                        listmpT2 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT2);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-18" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT2) {
                                                timeSlotT2 = mp.getXuatChieu();
                                                theaterT2 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT2, timeSlotT2,"T2")%>"><%=timeSlotT2%> <br> <%=theaterT2%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>

                                <%  Movie movieT3;
                                    String timeSlotT3;
                                    String theaterT3;
                                    ArrayList<MaPhongXuatChieu> listmpT3;
                                    ArrayList<Movie> listMvT3 = sm.getMovieByDate("T3");
                                    
                                    for (Movie mv : listMvT3) {
                                        listmpT3 = sm.getMaPhongXuatChieuByIdMovie(mv.getNo(), listT3);
                                %>
                                <div class="movie-time-line-box" movie-day="2024-03-19" style="display: none">      
                                    <h3 class="movie-name" > <%=mv.getName()%> </h3>
                                    <div class="lot-table">
                                        <div class="poster_content">
                                            <img src="<%=mv.getUrl()%>" alt=" <%=mv.getName()%>" >
                                        </div>
                                        <%
                                            for (MaPhongXuatChieu mp : listmpT3) {
                                                timeSlotT3 = mp.getXuatChieu();
                                                theaterT3 = mp.getMaPhong();
                                        %>
                                        <div class="time-slot">
                                            <span class="time" style="margin-left:15px"><a href="PageSelect?scheduleId=<%=sm.getScheduleIdByDayTimeSlot(theaterT3, timeSlotT3,"T3")%>"><%=timeSlotT3%> <br> <%=theaterT3%></a></span>
                                        </div> <% }%>
                                    </div>
                                </div>
                                <% }%>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="header/footer.jsp"/>
        </div>


        <script>
            var dayShowingItems = document.querySelectorAll('.day-showing-item');
            dayShowingItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    dayShowingItems.forEach(function (item) {
                        item.classList.remove('active-date');
                    });
                    this.classList.add('active-date');

                    var selectedDate = this.getAttribute('movie-day-selected');
                    var movieTimeLines = document.querySelectorAll('.movie-time-line-box');

                    movieTimeLines.forEach(function (movieTimeLine) {
                        var movieDay = movieTimeLine.getAttribute('movie-day');
                        if (movieDay === selectedDate) {
                            movieTimeLine.style.display = 'block';
                        } else {
                            movieTimeLine.style.display = 'none';
                        }
                    });
                });
            });
        </script>
    </body>

</html>