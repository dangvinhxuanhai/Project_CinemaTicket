<%@page import="model.CategoryDAO"%>
<%@page import="model.Category"%>
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
            <h1>add-Movie</h1>
            <form action="AdminServlet" method="GET">
                <input type="hidden" name="command" value="ADD" />

                <table border="0">
                    <tbody>
                        <tr>
                            <td>NameMovie: </td>
                            <td><input type="text" name="name" ></td>
                        </tr>
                        <tr>
                            <td>Img: </td>
                            <td><input type="text" name="url" ></td>
                        </tr>
                        <tr>
                            <td>Img2: </td>
                            <td><input type="text" name="url2" ></td>
                        </tr>
                        <tr>
                            <td>Introduce:  </td>
                            <td><input type="text" name="introduce"></td>
                        </tr>
                        <tr>
                            <td>Actor: </td>
                            <td><input type="text" name="actor"></td>
                        </tr>
                        <tr>
                            <td>Lenght:</td>
                            <td><input type="text" name="lenght"></td>
                        </tr>
                        <tr>
                            <td>Premiere: </td>
                            <td><input type="text" name="premiere"></td>
                        </tr>
                        <tr>
                            <td>Category1:</td>
                            <td><select class="form-control" name="categoryId1">
                                    <option value="">Select options</option>
                                    <% ArrayList<Category> list = CategoryDAO.getAllCategorys();
                                        for(Category ct : list){
                                    %>
                                    <option value="<%=ct.getCategoryID()%>"><%=ct.getName()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Category2:</td>
                            <td><select class="form-control" name="categoryId2">
                                    <option value="">Select options</option>
                                    <%for(Category ct : list){
                                    %>
                                    <option value="<%=ct.getCategoryID()%>"><%=ct.getName()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Directors:</td>
                            <td><input type="text" name="Directors"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Save" class="save" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>

            <p>
                <a href="AdminServlet"> Back to the List</a>
            </p>
        </div>
    </body>
</html>
