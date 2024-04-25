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
        <div id="wrapper" style="display: flex;justify-content: center;align-content: center">
            <div id="header">
                <h1>list-Schedule page</h1>
            </div>
        </div>
        <div id="container">
            <%--put the new button here --%>
            <div style="display: flex;justify-content: center;align-content: center">
                <div>
                    <div style="display: flex;justify-content: center;align-content: center">
                        <div>
                            <hr>
                            <input type="submit" value="Add Schedule"
                                   onclick="window.location.href = 'PageAddSc';return false;"
                                   class="add-Movie-button"
                                   />
                            <input type="submit" value="Show Movie"
                                   onclick="window.location.href = 'AdminServlet';return false;"
                                   class="add-Movie-button"
                                   />
                            <input type="submit" value="Show Order"
                                   onclick="window.location.href = 'AdminServlet?command=SHOW';return false;"
                                   class="add-Movie-button"
                                   />
                        </div>
                    </div>


                    <!--             <input type="submit" value="Show Order"
                                       onclick="window.location.href = 'AdminServlet';return false;"
                                       class="button"
                                       />-->

                    <div id="content">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Movie Name</th>
                                    <th>TimeSlot</th>
                                    <th>Theater</th>
                                    <th>Date</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="sc" items="${Schedule}">
                                    <!-- set up a link for each student -->
                                    <c:url var="tempLink" value="AdminServlet">
                                        <c:param name="command" value="LoadSc"></c:param>
                                        <c:param name="ID" value="${sc.getScheduleID()}"></c:param>
                                    </c:url>
                                    <!-- set up a link to delete a student -->
                                    <c:url var="deleteLink" value="AdminServlet">
                                        <c:param name="command" value="DeleteSc"></c:param>
                                        <c:param name="ID" value="${sc.getScheduleID()}"></c:param>
                                    </c:url>
                                    <tr>
                                        <td>${sc.getScheduleID()}</td>
                                        <td>${sc.getMovie().getName()}</td>
                                        <td>${sc.getTimeSlot()}</td>
                                        <td>${sc.getTheater()}</td>
                                        <td>${sc.getDate()}</td>

                                        <td><a href="${tempLink}">Update</a>
                                            <a href="${deleteLink}"
                                               onclick="if (!(confirm('Sure?')))
                                                           return false"
                                               >Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
