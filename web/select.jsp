<%@page import="java.util.ArrayList"%>
<%@page import="model.Seat"%>
<%@page import="model.Schedule"%>
<%@page import="model.ScheduleManager"%>
<%@page import="model.SeatManager"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Select seat page</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Loading main css file -->
        <link rel="stylesheet" href="style.css">

        <style>
            .seat-map {
                display: grid;
                grid-template-columns: repeat(9, 1fr);
                gap: 5px;
                width: 450px;
                margin: 0 auto;
            }
            .text{
                height: 20px;
            }
            .screen{
                width: 444px;
                height: 40px;
                background-color: #666666;
                border: 1px solid #666666;
                cursor: pointer;
                margin-bottom: 10px;
                display: flex;
                align-items: center; /* c?n gi?a theo chi?u d?c */
                justify-content: center;

            }
            .seat {
                width: 40px;
                height: 40px;
                background-color: #ccc;
                border: 1px solid #aaa;
                cursor: pointer;
                display: flex;
                align-items: center; /* c?n gi?a theo chi?u d?c */
                justify-content: center;
            }
            .was{
                width: 40px;
                height: 40px;
                background-color: #990000;
                color: #ffffff;
                border: 1px solid #aaa;
                cursor: pointer;
                display: flex;
                align-items: center; /* c?n gi?a theo chi?u d?c */
                justify-content: center;
            }
            .mainContent{
                display: flex;
                justify-content: center;
                flex-direction: column; /* ??m b?o các ph?n t? con ???c x?p theo chi?u d?c */
                align-items: center;
            }
            .inline{
                display: flex;
                justify-content: left;
                width: 400px;
                font-size: 20px;
                color: black;
            }
            .inlineImg{
                display: flex;
                justify-content: center;
            }

            .seat.selected {
                background-color: #ffff99; /* Màu gh? ?ã ch?n */
            }

            .ghe {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
            }
            #overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                display: none;
                z-index: 1000;
            }

            #popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                z-index: 1001;
                display: none;
            }

            #popup-content {
                text-align: center;
            }

            #close {
                position: absolute;
                top: 5px;
                right: 10px;
                cursor: pointer;
            }
        </style>
        <!--[if lt IE 9]>
        <script src="js/ie-support/html5.js"></script>
        <script src="js/ie-support/respond.js"></script>
        <![endif]-->

    </head>


    <body>


        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <jsp:include page="header/header.jsp"/>
            <main class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="seat-map">
                                <div class="screen"><b class="text ">SCREEN</b></div>
                            </div>
                            <div class="seat-map">
                                <%
                                    String scheduleIdString = request.getParameter("scheduleId");
                                    int scheduleId = Integer.parseInt(scheduleIdString);
                                    ScheduleManager scheduleManager = new ScheduleManager();
                                    Schedule schedule = scheduleManager.getScheduleById(scheduleId);
                                    SeatManager sm = new SeatManager();
                                    ArrayList<Seat> seatList = sm.getSeatBySchedule(schedule.getScheduleID());
                                    String nameSeat;
                                    for (Seat st : seatList) {
                                        nameSeat = st.getName();
                                        if (st.getTrangThai()) {
                                %>
                                <div class="was" ><%=nameSeat%></div>
                                <%} else {%>
                                <div class="seat" data-seatid="<%= st.getName()%>" 
                                     onclick="toggleSeat(this)"><%=nameSeat%></div>
                                <%}
                                    }%>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <form action="BookingServlet" id="bookingForm" method="POST">
                                <div class="mainContent">
                                    
                                    <div class="inlineImg"><img src="<%=schedule.getMovie().getUrl()%>" alt="Movie 3" style="height: 400px    ;"></div>
                                    <div style="display: flex; justify-content: center; width: 500px;margin-top: 50px">
                                    <ul class="starring">
                                        <li><strong>Rating:</strong> 
                                            <div class="star-rating" title="Rated 4.00 out of 5"><span style="width:80%"><strong class="rating">4.00</strong> out of 5</span></div>
                                        </li>
                                        <li><strong>Length:</strong> <%=schedule.getMovie().getLenght()%> min</li>
                                        <li><strong>Premiere:</strong> <%=schedule.getMovie().getPremiere()%></li>
                                        <li><strong>Category:</strong> <%=schedule.getMovie().getCategory1().getName()%>/<%=schedule.getMovie().getCategory2().getName()%></li>
                                        <li><strong>Directors:</strong> <%=schedule.getMovie().getDirectors()%></li>                                       
                                        <li><strong>Stars:</strong> <%=schedule.getMovie().getActor()%></li>
                                    </ul>
                                    </div>
                                    <div class="inline"><strong>The seats selected are : </strong><strong><div class="seatCode"></div></strong></div>
                                    <div class="inline"><strong>Ticket number :  </strong><strong><div class="numberTickets"></div></strong></div>
                                    <div class="inline"><strong>Total price :  </strong><strong><div class="totalPrice"></div></strong></div>
                                </div>
                                <button class="ghe" onclick="return bookSeats()">Booking</button>
                            </form>
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
                                    var selectedSeats = [];

                                    // Hàm tính t?ng giá ti?n
                                    function calculateTotalPrice(selectedSeats) {
                                        var ticketPrice = 70000; // Gi? s? giá vé là 70,000 VND
                                        var totalPrice = selectedSeats.length * ticketPrice;
                                        var totalPriceDiv = document.querySelector('.totalPrice');
                                        totalPriceDiv.textContent = totalPrice.toLocaleString();
                                    }

                                    // Hàm ch?n ho?c h?y ch?n m?t gh?
                                    function toggleSeat(seat) {
                                        seat.classList.toggle('selected');
                                        var seatId = seat.getAttribute('data-seatid');
                                        var index = selectedSeats.indexOf(seatId);
                                        if (index === -1) {
                                            selectedSeats.push(seatId);
                                        } else {
                                            selectedSeats.splice(index, 1);
                                        }

                                        updateSelectedSeatsInfo();
                                    }

                                    // Hàm c?p nh?t thông tin gh? ?ã ch?n
                                    function updateSelectedSeatsInfo() {
                                        var seatCodeDiv = document.querySelector('.seatCode');
                                        seatCodeDiv.textContent = selectedSeats.join(', ');
                                        var numberTicketsDiv = document.querySelector('.numberTickets');
                                        numberTicketsDiv.textContent = selectedSeats.length;
                                        calculateTotalPrice(selectedSeats);
                                    }

                                    // Hàm ??t vé
                                    function bookSeats() {
                                        if (selectedSeats.length === 0) {
                                            alert('Please select at least one seat.');
                                            return false; 
                                        } else {
                                            
                                            var confirmation = confirm('Do you want to book ' + selectedSeats.length + ' seats?');
                                            if (confirmation) {
                                                
                                                var scheduleId = '<%=schedule.getScheduleID()%>';
                                                var totalSeats = selectedSeats.length;
                                                var seatNames = selectedSeats.join(',');

                                                
                                                var hiddenInput1 = document.createElement('input');
                                                hiddenInput1.type = 'hidden';
                                                hiddenInput1.name = 'selectedSeats';
                                                hiddenInput1.value = seatNames;
                                                document.getElementById('bookingForm').appendChild(hiddenInput1);
                                                var hiddenInput2 = document.createElement('input');
                                                hiddenInput2.type = 'hidden';
                                                hiddenInput2.name = 'totalSeats';
                                                hiddenInput2.value = totalSeats;
                                                document.getElementById('bookingForm').appendChild(hiddenInput2);
                                                var hiddenInput3 = document.createElement('input');
                                                hiddenInput3.type = 'hidden';
                                                hiddenInput3.name = 'scheduleId';
                                                hiddenInput3.value = scheduleId;
                                                document.getElementById('bookingForm').appendChild(hiddenInput3);

                                                return true;
                                            } else {
                                                return false;
                                            }
                                        }
                                    }
        </script>
    </body>

</html>