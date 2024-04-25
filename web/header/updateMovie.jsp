<%@page import="model.MovieDAO"%>
<%@page import="model.Movie"%>
<%@page import="model.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
            <h1>update-movie</h1>
            <hr>
            <form action="AdminServlet" method="GET">
                <input type="hidden" name="command" value="UPDATE">
                <input type="hidden" name="No" value="${THE_Movie.getNo()}">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>NameMovie: </td>
                            <td><input type="text" name="name" value="${THE_Movie.getName()}"></td>
                        </tr>
                        <tr>
                            <td>Img: </td>
                            <td><input type="text" name="url" value="${THE_Movie.getUrl()}"></td>
                        </tr>
                        <tr>
                            <td>Img2: </td>
                            <td><input type="text" name="url2" value="${THE_Movie.getUrl2()}"></td>
                        </tr>
                        <tr>
                            <td>Introduce:  </td>
                            <td><input type="text" name="introduce" value="${THE_Movie.getIntroduce()}"></td>
                        </tr>
                        <tr>
                            <td>Actor: </td>
                            <td><input type="text" name="actor" value="${THE_Movie.getActor()}"></td>
                        </tr>
                        <tr>
                            <td>Lenght:</td>
                            <td><input type="text" name="lenght" value="${THE_Movie.lenght}"></td>
                        </tr>
                        <tr>
                            <td>Premiere: </td>
                            <td><input type="text" name="premiere" value="${THE_Movie.getPremiere()}"></td>
                        </tr>
                        <tr>
                            <td>Category1:</td>
                            <td><select class="form-control" name="categoryId1">
                                    <%
                                        Movie mv = (Movie) request.getAttribute("THE_Movie");
                                        ArrayList<Category> list = CategoryDAO.getAllCategorys();
                                        for (Category ct : list) {
                                            if (mv.getCategory1().getCategoryID() == ct.getCategoryID()) {
                                    %>
                                    <option value="<%=ct.getCategoryID()%>" selected=""><%=ct.getName()%></option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=ct.getCategoryID()%>"><%=ct.getName()%></option>
                                    <%}
                                        }%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Category2:</td>
                            <td><select class="form-control" name="categoryId2">
                                    <%
                                        for (Category ct : list) {
                                            if (mv.getCategory2().getCategoryID() == ct.getCategoryID()) {
                                    %>
                                    <option value="<%=ct.getCategoryID()%>" selected=""><%=ct.getName()%></option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=ct.getCategoryID()%>"><%=ct.getName()%></option>
                                    <%}
                                        }%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Directors:</td>
                            <td><input type="text" name="Directors" value="${THE_Movie.getDirectors()}"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="UPDATE" class="save" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <a href="AdminServlet?command=LIST">back to movie list</a>
        </div>
    </body>
</html>
