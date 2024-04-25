<%@page import="model.MovieDAO"%>
<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Schedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="wrapper">
        </div>
        <div id="container">
            <h1>update-Schedule</h1>
            <hr>
            <div style="display: flex;justify-content: center;align-content: center">
                <div>
                    <form action="AdminServlet" method="GET">
                        <input type="hidden" name="command" value="UpdateSc">
                        <input type="hidden" name="ID" value="${Schedule.getScheduleID()}">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>movieId:</td>
                                    <td><select class="form-control" name="movieId">
                                            <%
                                                Schedule sc = (Schedule) request.getAttribute("Schedule");
                                                ArrayList<Movie> list = MovieDAO.getAllMovies();
                                                for (Movie mv : list) {
                                                    if (sc.getMovie().getNo() == mv.getNo()) {
                                            %>
                                            <option value="<%=mv.getNo()%>" selected><%=mv.getName()%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%=mv.getNo()%>"><%=mv.getName()%></option>
                                            <% }
                                                }%>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>TimeSlot: </td>
                                    <td>
                                        <select class="form-control" name="TimeSlot">
                                            <%

                                                String[] timeSlots = {"2h-5h", "5h30-8h30", "9h-12h"};
                                                for (int i = 0; i < timeSlots.length; i++) {
                                                    String optionValue = timeSlots[i];
                                                    if (sc.getTimeSlot().equals(optionValue)) {
                                            %>
                                            <option value="<%= optionValue%>" selected><%= optionValue%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= optionValue%>"><%= optionValue%></option>
                                            <% }
                                                }%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Theater:  </td>
                                    <td>
                                        <select class="form-control" name="Theater">
                                            <%
                                                for (int i = 1; i <= 8; i++) {
                                                    String optionValue = "B" + i;
                                                    if (sc.getTheater().equals(optionValue)) {
                                            %>
                                            <option value="<%= optionValue%>" selected><%= optionValue%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= optionValue%>"><%= optionValue%></option>
                                            <% }
                                                }%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Date: </td>
                                    <td>
                                        <select class="form-control" name="Date">
                                            <%
                                                String[] daysOfWeek = {"T2", "T3", "T4", "T5", "T6", "T7", "CN"};
                                                for (int i = 0; i < daysOfWeek.length; i++) {
                                                    String optionValue = daysOfWeek[i];
                                                    if (sc.getDate().equals(optionValue)) {
                                            %>
                                            <option value="<%= optionValue%>" selected><%= optionValue%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= optionValue%>"><%= optionValue%></option>
                                            <% }
                                                }%>
                                        </select>
                                    </td>  
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="submit" value="UPDATE" class="save" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <a href="AdminServlet?command=ListSc">back to schedule list</a>
                </div>
            </div>
        </div>
    </body>
</html>
