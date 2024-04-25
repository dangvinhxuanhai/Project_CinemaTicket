/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.CategoryManager;
import model.Movie;
import model.MovieDAO;
import model.MovieManager;
import model.Schedule;
import model.ScheduleDAO;
import model.ScheduleManager;
import model.SeatDAO;
import model.Ticket;
import model.TicketManager;
import validate.validation;

/**
 *
 * @author DELL
 */
public class AdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listMovie(request, response);
                    break;
                case "ListSc":
                    listSchedule(request, response);
                    break;
                case "addSc":
                    addSc(request, response);
                    break;
                case "LoadSc":
                    loadSchedule(request, response);
                    break;
                case "DeleteSc":
                    deleteSchedule(request, response);
                    break;
                case "UpdateSc":
                    updateSchedule(request, response);
                case "SHOW":
                    listOrder(request, response);
                    break;
                case "ADD":
                    addMovie(request, response);
                    break;
                case "LOAD":
                    loadMovie(request, response);
                    break;
                case "UPDATE":
                    updateMovie(request, response);
                    break;
                case "DELETE":
                    deleteMovie(request, response);
                    break;
                default:
                    listMovie(request, response);
            }

        } catch (Exception ex) {

            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get movie from the the database
        MovieManager mm = new MovieManager();
        if (mm.getList() == null) {
            response.sendRedirect("PageAdminTest");
        }
        ArrayList<Movie> list = mm.getList();
        // add these students to the object request
        request.setAttribute("MovieList", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("PageAdminTest");
        dispatcher.forward(request, response);
    }

    private void addMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student info from the form
        CategoryManager cm = new CategoryManager();

        //int no = Integer.parseInt(request.getParameter("No"));
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        String url2 = request.getParameter("url2");
        String introduce = request.getParameter("introduce");
        String actor = request.getParameter("actor");
        String premiere = request.getParameter("premiere");
        String Directors = request.getParameter("Directors");
        String lenghtString = request.getParameter("lenght");
        String CategoryString2 = request.getParameter("categoryId2");
        String CategoryString1 = request.getParameter("categoryId1");
        if (name != null && !name.isEmpty() && url != null && !url.isEmpty() && url2 != null && !url2.isEmpty()
                && introduce != null && !introduce.isEmpty() && actor != null && !actor.isEmpty()
                && premiere != null && !premiere.isEmpty() && Directors != null && !Directors.isEmpty()
                && CategoryString2 != null && !CategoryString2.isEmpty() && CategoryString1 != null && !CategoryString1.isEmpty()
                && lenghtString != null && !lenghtString.isEmpty()) {
            int lenght = Integer.parseInt(lenghtString);
            int idCategory1 = Integer.parseInt(CategoryString1);
            Category category1 = cm.getCategoryById(idCategory1);
            int idCategory2 = Integer.parseInt(CategoryString2);
            Category category2 = cm.getCategoryById(idCategory2);
            //create a new student object
            Movie mv = new Movie(0, lenght, name, url, url2, introduce, actor, premiere, Directors, category1, category2);
            MovieDAO movieDAO = new MovieDAO();
            // add the student to the database
            if (validation.checkMovie(mv)) {
                movieDAO.addMovie(mv);
            }
        }

        // calling the student list jsp page
        listMovie(request, response);
    }

    private void loadMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student id from the form data
        int MovieID = Integer.parseInt(request.getParameter("No"));

        //get student from the database
        MovieManager mm = new MovieManager();
        Movie mv = mm.getMovieById(MovieID);
        //place student in the request attribute
        request.setAttribute("THE_Movie", mv);
        //send to jsp page: update-student-form.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("PageUpdateM");
        dispatcher.forward(request, response);
    }

    private void updateMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read student info from the form data
        CategoryManager cm = new CategoryManager();

        int no = Integer.parseInt(request.getParameter("No"));

        String name = request.getParameter("name");
        String url = request.getParameter("url");
        String url2 = request.getParameter("url2");
        String introduce = request.getParameter("introduce");
        String actor = request.getParameter("actor");
        String premiere = request.getParameter("premiere");
        String Directors = request.getParameter("Directors");
        String lenghtString = request.getParameter("lenght");
        String CategoryString1 = request.getParameter("categoryId1");
        String CategoryString2 = request.getParameter("categoryId2");
        if (name != null && !name.isEmpty() && url != null && !url.isEmpty() && url2 != null && !url2.isEmpty()
                && introduce != null && !introduce.isEmpty() && actor != null && !actor.isEmpty()
                && premiere != null && !premiere.isEmpty() && Directors != null && !Directors.isEmpty()
                && CategoryString2 != null && !CategoryString2.isEmpty() && CategoryString1 != null && !CategoryString1.isEmpty()
                && lenghtString != null && !lenghtString.isEmpty()) {
            int lenght = Integer.parseInt(lenghtString);
            int idCategory1 = Integer.parseInt(CategoryString1);
            Category category1 = cm.getCategoryById(idCategory1);
            int idCategory2 = Integer.parseInt(CategoryString2);
            Category category2 = cm.getCategoryById(idCategory2);
            Movie mv = new Movie(no, lenght, name, url, url2, introduce, actor, premiere, Directors, category1, category2);
            new MovieDAO().updateMovie(mv);
        } else {
            loadMovie(request, response);
        }

        //send them back to the "list student" page
        listMovie(request, response);
    }

    private void deleteMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student id from the form data
        String No = request.getParameter("No");
        new MovieDAO().deleteDonhang(No);
        new MovieDAO().deletSchedule(No);

        // delete student from the database
        new MovieDAO().deleteMovie(No);
        // send them back to the "list student" pages
        listMovie(request, response);
    }

    private void listOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get movie from the the database
        TicketManager tk = new TicketManager();
        if (tk.getList() == null) {
            response.sendRedirect("PageOrder");
        }
        ArrayList<Ticket> list = tk.getList();
        // add these students to the object request
        request.setAttribute("Order", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("PageOrder");
        dispatcher.forward(request, response);
    }

    private void listSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get movie from the the database
        ScheduleManager sm = new ScheduleManager();
        if (sm.getList() == null) {
            response.sendRedirect("PageAdminSc");
        }
        ArrayList<Schedule> list = sm.getList();
        // add these students to the object request
        request.setAttribute("Schedule", list);
        request.removeAttribute("command");
        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("PageAdminSc");
        dispatcher.forward(request, response);
    }

    private void loadSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student id from the form data
        int ID = Integer.parseInt(request.getParameter("ID"));

        //get student from the database
        ScheduleManager sm = new ScheduleManager();
        Schedule sc = sm.getScheduleById(ID);
        //place student in the request attribute
        request.setAttribute("Schedule", sc);
        //send to jsp page: update-student-form.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("PageUpdateSc");
        dispatcher.forward(request, response);
    }

    private void addSc(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MovieManager mm = new MovieManager();
        String TimeSlot = request.getParameter("TimeSlot");
        String Theater = request.getParameter("Theater");
        String Date = request.getParameter("Date");
        String movieIdString = request.getParameter("movieId");
        if (TimeSlot != null && !TimeSlot.isEmpty() && Theater != null && !Theater.isEmpty()
                && Date != null && !Date.isEmpty() && movieIdString != null && !movieIdString.isEmpty()) {
            int movieId = Integer.parseInt(movieIdString);
            Movie movie = mm.getMovieById(movieId);
            Schedule sc = new Schedule(0, movie, TimeSlot, Theater, Date);
            ScheduleDAO sd = new ScheduleDAO();
            SeatDAO seatD = new SeatDAO();
            if (validation.checkSchedule(sc)) {
                sd.addScedule(sc);
                seatD.addSeat(sd.getNewestSchedule());
            }
        }
        // calling the list jsp page
        listSchedule(request, response);

    }

    private void updateSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MovieManager mm = new MovieManager();
        int ScheduleID = Integer.parseInt(request.getParameter("ID"));
        String TimeSlot = request.getParameter("TimeSlot");
        String Theater = request.getParameter("Theater");
        String Date = request.getParameter("Date");
        String movieIdString = request.getParameter("movieId");
        if (TimeSlot != null && !TimeSlot.isEmpty() && Theater != null && !Theater.isEmpty()
                && Date != null && !Date.isEmpty() && movieIdString != null && !movieIdString.isEmpty()) {
            int movieId = Integer.parseInt(movieIdString);
            Movie movie = mm.getMovieById(movieId);
            Schedule sc = new Schedule(ScheduleID, movie, TimeSlot, Theater, Date);
                //perform update on database
                new ScheduleDAO().updateSchedule(sc);
//                send them back to the "list student" page
        }
        listSchedule(request, response);
    }

    private void deleteSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student id from the form data
        String ID = request.getParameter("ID");
        new ScheduleDAO().deleteDonhang(ID);
        new ScheduleDAO().deletSchedule(ID);

        listSchedule(request, response);
    }

}
