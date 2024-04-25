<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/admin_style.css" rel="stylesheet" type="text/css"/>

        <style>
            #content table {
                font-size: 10px; /* Adjust the font size as needed */
                width: 100%; /* Make the table fill its container */
                border-collapse: collapse; /* Collapse borders */
            }

            #content th,
            #content td {
                padding: 8px; /* Adjust the padding */
                border: 1px solid #ccc; /* Add border */
            }

            #content th {
                background-color: #f2f2f2; /* Add background color to header */
            }

            #content a {
                text-decoration: none; /* Remove underline from links */
                color: blue; /* Set link color */
                margin-right: 5px; /* Adjust margin */
            }
        </style>
    </head>
    <body>
        <div id="wrapper" style="display: flex;justify-content: center;align-content: center">
            <div id="header">
                <h1>list-Movie page</h1>
            </div>
        </div>
        <div id="container">
            <div style="display: flex;justify-content: center;align-content: center">
                <div>
                    <%--put the new button here --%>
                    <hr>

                    <input type="submit" value="Add Movie"
                           onclick="window.location.href = 'PageAddM';return false;"
                           class="add-Movie-button"
                           />
                    <input type="submit" value="Show Order"
                           onclick="window.location.href = 'AdminServlet?command=SHOW';return false;"
                           class="add-Movie-button"
                           />


                    <!--show Schedule-->

                    <input type="submit" value="Show Schedule "
                           onclick="window.location.href = 'AdminServlet?command=ListSc';return false;"
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
                            <th>Name Movie</th>
                            <th>Img</th>
                            <th>Img2</th>
                            <th>Introduce</th>
                            <th>Actor</th>
                            <th>Lenght</th>
                            <th>Premiere</th>
                            <th>CategoryId1</th>
                            <th>CategoryId2</th>
                            <th>Directors</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="movie" items="${MovieList}">
                            <!-- set up a link for each student -->
                            <c:url var="tempLink" value="AdminServlet">
                                <c:param name="command" value="LOAD"></c:param>
                                <c:param name="No" value="${movie.getNo()}"></c:param>
                            </c:url>
                            <!-- set up a link to delete a student -->
                            <c:url var="deleteLink" value="AdminServlet">
                                <c:param name="command" value="DELETE"></c:param>
                                <c:param name="No" value="${movie.getNo()}"></c:param>
                            </c:url>
                            <tr>
                                <td>${movie.getNo()}</td>
                                <td>${movie.getName()}</td>
                                <td>${movie.getUrl()}</td>
                                <td>${movie.getUrl2()}</td>
                                <td>${movie.getIntroduce()}</td>
                                <td>${movie.getActor()}</td>
                                <td>${movie.getLenght()}</td>
                                <td>${movie.getPremiere()}</td>
                                <td>${movie.getCategory1()}</td>
                                <td>${movie.getCategory2()}</td>
                                <td>${movie.getDirectors()}</td>
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
    </body>
</html>
