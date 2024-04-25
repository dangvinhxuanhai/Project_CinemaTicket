<%-- 
    Document   : donHang
    Created on : Mar 15, 2024, 11:57:00 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/admin_style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="wrapper"  style="display: flex;justify-content: center;align-content: center">
            <div id="header">
                <h1>list-Order page</h1>
            </div>
        </div>
        <div id="container">
            <div style="display: flex;justify-content: center;align-content: center">
                <div>
                    <%--put the new button here --%>
                    <hr>
                    <input type="submit" value="Show Movie"
                           onclick="window.location.href = 'AdminServlet';return false;"
                           class="add-Movie-button"
                           />
                    <input type="submit" value="Show Schedule"
                           onclick="window.location.href = 'AdminServlet?command=ListSc';return false;"
                           class="add-Movie-button"
                           />
                    <input type="submit" value="Show Order"
                           onclick="window.location.href = 'AdminServlet?command=SHOW';return false;"
                           class="add-Movie-button"
                           />
                </div>
            </div>

            <div id="content">
                <table border="1">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>id_User</th>
                            <th>id_Phim</th>
                            <th>schedule</th>
                            <th>maPhong</th>
                            <th>soLuongVe</th>
                            <th>trangthai</th>
                            <th>totalPrice</th>
                            <th>Time</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dh" items="${Order}">
                            <tr>
                                <td>${dh.getMaVe()}</td>
                                <td>${dh.getUser()}</td>
                                <td>${dh.getMovie()}</td>
                                <td>${dh.getSchedule()}</td>
                                <td>${dh.getMaPhong()}</td>
                                <td>${dh.getSoluong()}</td>
                                <td>${dh.getTrangThai()}</td>
                                <td>${dh.getTotalPrice()}</td>
                                <td>${dh.getTime()}</td>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
