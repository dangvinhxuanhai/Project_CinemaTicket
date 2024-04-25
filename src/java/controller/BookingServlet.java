/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Movie;
import model.MovieManager;
import model.Schedule;
import model.ScheduleManager;
import model.SeatDAO;
import model.Ticket;
import model.TicketDAO;

/**
 *
 * @author lenovo
 */
public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScheduleManager sm = new ScheduleManager();
        MovieManager mm = new MovieManager();
        HttpSession session = request.getSession();
        
        // Đọc dữ liệu được gửi từ trình duyệt
        String selectedSeats = request.getParameter("selectedSeats");
        int numberOfTickets = Integer.parseInt(request.getParameter("totalSeats"));
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        ArrayList<String> SA = new ArrayList<>();
        String[] seatArray = selectedSeats.split(",");
        for(String st : seatArray){
            SA.add(st);
        }
        SeatDAO.updateSeats(SA, scheduleId);
        Schedule schedule = sm.getScheduleById(scheduleId);
        Movie movie = schedule.getMovie();
        Account acc = (Account) session.getAttribute("account");
        Ticket tk = new Ticket(1, acc, schedule.getTheater(), 1, numberOfTickets, movie, schedule, numberOfTickets*70000, "aaa");
        TicketDAO.AddTickets(tk);
        response.sendRedirect("PageAccount");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
