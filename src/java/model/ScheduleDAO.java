package model;

import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ScheduleDAO {

    public static ArrayList<Schedule> getAllSchedules() {
        ArrayList<Schedule> ScheduleList = new ArrayList<>();
        int scheduleID, movieId;
        Movie movie;
        String timeSlot;
        String theater;
        String date;
        //manager
        MovieManager mn = new MovieManager();

        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM Schedule";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                scheduleID = rs.getInt("ScheduleID");
                movieId = rs.getInt("MovieID");
                timeSlot = rs.getString("TimeSlot");
                theater = rs.getString("Theater");
                date = rs.getString("Date");
                movie = mn.getMovieById(movieId);
                Schedule schedule = new Schedule(scheduleID, movie, timeSlot, theater, date);
                ScheduleList.add(schedule);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        return ScheduleList;
    }

    public void addScedule(Schedule sc) {
        // create sql for insert
        String sql = """
                     INSERT INTO Schedule (MovieID, TimeSlot, Theater, Date)
                     VALUES ( ?, ?, ?, ?);""";
        ConnectDB db = ConnectDB.getInstance();

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, sc.getMovie().getNo());
            statement.setString(2, sc.getTimeSlot());
            statement.setString(3, sc.getTheater());
            statement.setString(4, sc.getDate());
            statement.executeUpdate();

            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateSchedule(Schedule sc) {
        String sql = """
                     UPDATE [webcinemal].[dbo].[Schedule]
                     SET  MovieID=?,TimeSlot=?, Theater =? , Date=?
                     WHERE ScheduleID =  ?""";
        ConnectDB db = ConnectDB.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(4, sc.getDate());
            statement.setString(3, sc.getTheater());
            statement.setString(2, sc.getTimeSlot());
            statement.setInt(1, sc.getMovie().getNo());

            statement.setInt(5, sc.getScheduleID());
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteDonhang(String No) {
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to execute the sql comments
            String sql = "delete from DonHang where xuatChieu=?;";
            PreparedStatement statement = con.prepareStatement(sql);
            // convert String id to int id
            int id = Integer.parseInt(No);
            // set parameter in the sql
            statement.setInt(1, id);
            // execute the sql
            statement.execute();
            con.close();
            statement.close();

        } catch (Exception ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deletSchedule(String ID) {
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to execute the sql comments
            String sql = "DELETE from seat WHERE id_Schedule=?;"
                    + "DELETE FROM Schedule WHERE ScheduleID=?";
            
            PreparedStatement statement = con.prepareStatement(sql);
            // convert String id to int id
            int id = Integer.parseInt(ID);
            // set parameter in the sql
            statement.setInt(1, id);
            statement.setInt(2, id);
            // execute the sql
            statement.execute();
            con.close();
            statement.close();

        } catch (Exception ex) {
            Logger.getLogger(ScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNewestSchedule() {
        int id=0;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT TOP 1 * FROM Schedule ORDER BY ScheduleID DESC;";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            if (rs.next()) {
            id = rs.getInt("ScheduleID");
        }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        return id;
    }
}
