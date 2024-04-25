<%@page import="model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.TicketManager"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Body Account Page</title>

        <style>
            /* Reset CSS */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            .midContent {
                font-family: Arial, sans-serif;
                background-color: white;      /*Màu n?n t?ng th?*/
            }

            .container {
                margin-right: auto;
                margin-left: auto;
                padding-left: 15px;
                padding-right: 15px;
                *zoom: 1;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
                justify-content: center; /* C?n gi?a các dòng */
            }
            .box{
                border-bottom: 3px solid #999999;
                padding-bottom: 30px;
            }

            .col-md-6 {
                flex: 0 0 50%;
                max-width: 50%;
                padding-right: 15px;
                padding-left: 15px;
            }

            /* Page Title */
            .page-title {
                margin-bottom: 20px;
            }

            .page-title h1,
            .page-title h2 {
                color: #333;
            }

            /* Form */
            .form-group {
                margin-bottom: 20px;
            }

            label {
                margin-left: 5px;
                font-weight: bold;
            }

            .custom-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                background-color: #fff;
                color: #333;
                outline: none;
            }

            .custom-input[type="radio"] {
                width: auto;
            }

            /* Buttons */
            .buttons-set {
                margin-top: 20px;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;  /*Màu nút*/
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }

            .btn:hover {
                background-color: #0056b3;  /*Màu hover c?a nút */
            }

            Table
            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 30px;
            }

            .table th,
            .table td {
                border: 1px solid #ccc;
                padding: 10px;
                padding-left: 20px;
                padding-right: 20px;
            }

            .table th {
                background-color: #007bff;  /*Màu n?n header c?a b?ng */
                color: #fff;
                font-weight: bold;
                text-align: left;
            }

            .table td {
                background-color: #fff;  /*Màu n?n c?a các ô d? li?u */
            }

            /* Responsive */
            @media (max-width: 767px) {
                .col-md-6 {
                    flex: 0 0 100%;
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="midContent">
            <div class="row"style="background-color: white;" >
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="my-account">
                        <div class="page-title">
                            <h1>Information Account</h1>
                        </div>
                        <div class="box">
                            <form action="/cap-nhat-tai-khoan/" method="post" autocomplete="off" id="profile-validate"
                                  class="scaffold-form metiz-edit-account" enctype="multipart/form-data" novalidate="novalidate">
                                <input type="hidden" name="csrfmiddlewaretoken"
                                       value="j25B7WamhVani2DNzTqbveuAnqYEz4V56eVICxGq4IeM6pu94eVK3AzS4owP0D13">
                                <%
                                    Account account = (Account) session.getAttribute("account");
                                %>
                                <div class="row">
                                    <!-- First Column (col-md-3) -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id">ID</label>
                                            <input type="text" name="id" id="id" class="form-control custom-input" readonly
                                                   value="<%=account.getId()%>" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="username">Username</label>
                                            <input type="text" name="username" id="username" class="form-control custom-input"
                                                   value="<%=account.getUsername()%>" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="full_name">Name</label>
                                            <input type="text" name="full_name" id="full_name" class="form-control custom-input"
                                                   value="<%=account.getDisplayname()%>" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <br>
                                            <%if (account.getGender().toLowerCase().equalsIgnoreCase("male")) {%>
                                            <div class="form-check form-check-inline">
                                                <label class="form-check-label">
                                                    <input class="form-check-input custom-input" type="radio" name="gender" id="gender"
                                                           value="male" checked disabled> Male
                                                </label>
                                                <label class="form-check-label" style="margin-left: 10px">
                                                    <input class="form-check-input custom-input" type="radio" name="gender" id="gender"
                                                           value="female" disabled> Female
                                                </label>
                                            </div>
                                            <%} else {%>
                                            <div class="form-check form-check-inline">
                                                <label class="form-check-label">
                                                    <input class="form-check-input custom-input" type="radio" name="gender" id="gender"
                                                           value="male"  disabled> Male
                                                </label>
                                                <label class="form-check-label" >
                                                    <input class="form-check-input custom-input" type="radio" name="gender" id="gender"
                                                           value="female" checked disabled> Female
                                                </label>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>

                                    <!-- Second Column (col-md-3) -->
                                    <div class="col-md-6">

                                        <div class="form-group form-birthday" >
                                            <label>Birthday</label>
                                            <div class="input-group" >
                                                <input type="text" name="birth_date" id="birth_date"
                                                       value="<%=account.getBd()%>" class="form-control custom-input" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone Number</label>
                                            <div class="form-group " >
                                                <div class="inline">
                                                    <div class="country-code"></div>
                                                    <input type="text" name="phone" id="phone"
                                                           value="<%=account.getPhone()%>" class="form-control textPhone custom-input" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" id="email" name="email"
                                                   value="<%=account.getEmail()%>" class="form-control custom-input" disabled >
                                        </div>
                                        <c:if test="${sessionScope.account.role eq 0}">
                                            <div class="form-group">
                                                <label>Role</label>
                                                <input type="text" id="email" name="email"
                                                       value="Admin" class="form-control custom-input" disabled >
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.account.role eq 1}">
                                            <div class="form-group">
                                                <label>Role</label>
                                                <input type="text" id="email" name="email"
                                                       value="Customer" class="form-control custom-input" disabled >
                                            </div>
                                        </c:if>

                                    </div>
                                </div>

<!--                                <div class="buttons-set metiz-edit-btn">
                                    <button type="submit" title="Save" class="btn btn-primary"><span><span>Save</span></span></button>
                                </div>-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="background-color: white;">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="my-account">
                        <!-- Existing form code goes here -->

                        <div class="page-title">
                            <h2>Additional Information Table</h2>
                        </div>

                        <!-- Additional table -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ID Phim</th>
                                    <th>Xuat Chieu</th>
                                    <th>Ma Phong</th>
                                    <th>So Luong Ve</th>
                                    <th>Thoi Gian</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                TicketManager tkm = new TicketManager();
                                ArrayList<Ticket> list = tkm.getTicketByIdUser(account.getId());
                                for(Ticket tk : list)
                                {
                                %>
                                <tr>
                                    <td><%=tk.getMaVe()%></td>
                                    <td><%=tk.getMovie().getName()%></td>
                                    <td><%=tk.getSchedule().getTimeSlot()%></td>
                                    <td><%=tk.getMaPhong()%></td>
                                    <td><%=tk.getSoluong()%></td>
                                    <td><%=tk.getTime()%></td>
                                </tr>
                                <%}%>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
