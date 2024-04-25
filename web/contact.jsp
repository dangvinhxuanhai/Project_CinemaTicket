<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Contact Page</title>

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
            <main class="main-content" style="padding-top: 70px">
                <div class="container">
                    <div class="page">
                        <div class="breadcrumbs">
                            <a href="index.jsp">Home</a>
                            <span>Contact</span>
                        </div>

                        <div class="content">
                            <div class="row">
                                <div class="col-md-4">
                                    <h2>Contact</h2>
                                    <ul class="contact-detail">
                                        <li>
                                            <img src="images/icon-contact-map.png" alt="#">
                                            <address><span>Company TTH. </span> <br>Khu Do Thi FPT City, Ngu Hanh Son, Da Nang City 550000</address>
                                        </li>
                                        <li>
                                            <img src="images/icon-contact-phone.png" alt="">
                                            <a href="tel:1590912831">0982441549</a>
                                        </li>
                                        <li>
                                            <img src="images/icon-contact-message.png" alt="">
                                            <a href="https://www.facebook.com/profile.php?id=100014760396949">TrungLVB@TTH.com</a>
                                        </li>
                                    </ul>
                                    <!--									<div class="contact-form">
                                                                                                                    <input type="text" class="name" placeholder="name...">
                                                                                                                    <input type="text" class="email" placeholder="email...">
                                                                                                                    <input type="text" class="website" placeholder="website...">
                                                                                                                    <textarea class="message" placeholder="message..."></textarea>
                                                                                                                    <input type="submit" value="Send Message ">
                                    
                                                                                                            </div>-->
                                </div>
                                <div class="col-md-7 col-md-offset-1">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15343.424671312003!2d108.2608913!3d15.9688859!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1709654703295!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- .container -->
            </main>
            <jsp:include page="header/footer.jsp"/>
        </div>
        <!-- Default snippet for navigation -->



        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>

    </body>

</html>