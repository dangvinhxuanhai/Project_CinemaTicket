<%-- 
    Document   : header
    Created on : Mar 16, 2024, 6:54:48 PM
    Author     : lenovo
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
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
            .login-node{
                text-align: center;
            }
            #find{
                background-color: #cccccc;
            }
            .bor{
                color: black;
            }
        </style>
    </head>
    <body>
        <header style="background-color: rgba(0,0,0,0.5) !important; width: 100%; padding: 30px">
            <div class="container" style="margin: 0;padding-left: 80px; padding-right: 40px; width: 100%;">
                <a href="PageHome" id="branding" style="margin-top: 10px">
                    <img src="images/logo.png" alt="" class="logo" style="transform: scale(1.5);">
                    <div class="logo-copy">
                        <h1 class="site-title">Company TTH</h1>
                        <small class="site-description">CINEMA</small>
                    </div>
                </a><!-- #branding -->

                <div class="main-navigation">
                    <button type="button" class="menu-toggle"><i class="fa fa-bars"></i></button>
                    <ul class="menu">
                        <li class="menu-item"><a href="PageHome">Home</a></li>
                        <li class="menu-item"><a href="PageAbout">About</a></li>
                        <li class="menu-item"><a href="PageContact">Contact</a></li>
                        <li class="menu-item"><a href="PageSchedule">Schedule</a></li>
                    </ul> <!-- .menu -->

                    <div class="menu">
                        <form action="SearchServlet" method="get">
                            <input type="text" name="nameMovie" placeholder="Search...">
                            <button style="background-color: #ff9900;"><i class="fa fa-search"></i></button>
                        </form>
                    </div> 
                    <ul class="login menu">
                        <%
                            Account account = null;
                            String displayName, address = "";
                            if (session.getAttribute("account") == null) {
                                displayName = "Login";
                                address = "LoginServlet";
                            } else {
                                account = (Account) session.getAttribute("account");
                                displayName = account.getDisplayname();
                                address = "PageAccount";
                            }
                        %>
                        <li class=" menu-item"><a class="login-node"  href="<%=address%>"><b class="bor"><%= displayName%></b></a></li>
                    </ul>
                    <c:if test="${sessionScope.account!=null}">
                        <ul class="menu">
                            <li class="LogOut menu-item"><a  href="LogOutServlet">Log Out</a></li>
                        </ul>
                        <c:if test="${sessionScope.account.role eq 0}">
                            <ul class="menu">
                                <li class="Setting menu-item"><a  href="AdminServlet">Setting Movie</a></li>
                            </ul>
                        </c:if>
                    </c:if>
                </div> <!-- .main-navigations -->

                <div class="mobile-navigation"></div>
            </div>
        </header>
    </body>
</html>
