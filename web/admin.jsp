<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Admin setting Page</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Loading main css file -->
        <link rel="stylesheet" href="style.css">



        
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
            <main class="main-content" style="padding-top: 70px">
                <div class="container" style="width: 100%;margin: 0;">
                    <jsp:include page="header/adminTestList.jsp"/>
                </div>
            </main>
            <jsp:include page="header/footer.jsp"/>
        </div>
        <!-- Default snippet for navigation -->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>

        <script>
            const seatMap = document.getElementById('seat-map');

            for (let row = 1; row <= 9; row++) {
                for (let col = 1; col <= 9; col++) {
                    const seat = document.createElement('div');
                    seat.className = 'seat';
                    seat.setAttribute('data-row', row);
                    seat.setAttribute('data-col', col);
                    seat.addEventListener('click', toggleSeat);
                    seatMap.appendChild(seat);
                }
            }

// X? lý khi gh? ???c ch?n
            function toggleSeat() {
                this.classList.toggle('selected');
            }

// X? lý khi ??t ch?
            function bookSeats() {
                const selectedSeats = document.querySelectorAll('.seat.selected');
                if (selectedSeats.length === 0) {
                    alert('Vui lòng ch?n gh? tr??c khi ??t ch?!');
                } else {
                    const seatNumbers = Array.from(selectedSeats).map(seat => {
                        const row = seat.getAttribute('data-row');
                        const col = seat.getAttribute('data-col');
                        return `Row ${row}, Seat ${col}`;
                    });
                    alert(`B?n ?ã ??t ch? thành công cho các gh?: ${seatNumbers.join(', ')}`);
                }
            }
        </script>
    </body>

</html>