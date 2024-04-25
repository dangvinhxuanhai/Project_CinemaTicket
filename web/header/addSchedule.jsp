<%@page import="model.MovieDAO"%>
<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1>add-Schedule</h1>
            <form action="AdminServlet" method="GET">
                <input type="hidden" name="command" value="addSc" />

                <table border="0">
                    <tbody>
                        <tr>
                            <td>movie: </td>
                            <td><select class="form-control" name="movieId">
                                    <option value="">Select options</option>
                                    <%
                                        ArrayList<Movie> list = MovieDAO.getAllMovies();
                                        for (Movie mv : list) {
                                    %>
                                    %>
                                    <option value="<%=mv.getNo()%>"><%=mv.getName()%></option>
                                    <% }%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>TimeSlot: </td>
                            <td>
                                <select class="form-control" name="TimeSlot">
                                    <option value="">Select options</option>
                                    <option value="2h-5h">2h-5h</option>
                                    <option value="5h30-8h30">5h30-8h30</option>
                                    <option value="9h-12h">9h-12h</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Theater:  </td>
                            <td>
                                <select class="form-control" name="Theater">
                                    <option value="">Select options</option>
                                    <option value="B1">B1</option>
                                    <option value="B2">B2</option>
                                    <option value="B3">B3</option>
                                    <option value="B4">B4</option>
                                    <option value="B5">B5</option>
                                    <option value="B6">B6</option> 
                                    <option value="B7">B7</option>
                                    <option value="B8">B8</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date: </td>
                            <td>
                                <select class="form-control" name="Date">
                                    <option value="">Select options</option>
                                    <option value="T2">T2</option>
                                    <option value="T3">T3</option>
                                    <option value="T4">T4</option>
                                    <option value="T5">T5</option>
                                    <option value="T6">T6</option>
                                    <option value="T7">T7</option>
                                    <option value="CN">CN</option>
                                </select>
                            </td>  
                        </tr>

                        <tr>
                            <td><input type="submit" value="Save" class="save" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>

            <p>
                <a href="AdminServlet?command=ListSc"> Back to the List</a>
            </p>
        </div>
    </body>
</html>
