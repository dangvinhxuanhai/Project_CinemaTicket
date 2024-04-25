/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dbconnext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class SeatDAO {

    public static ArrayList<Seat> getAllSeats() {
        ArrayList<Seat> seatList = new ArrayList<>();
        int id_Schedule, idSeat;
        String name;
        Schedule Schedule;
        ScheduleManager sm = new ScheduleManager();
        Boolean trangThai;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM Seat";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                name = rs.getString("nameSeat");
                id_Schedule = rs.getInt("id_Schedule");
                Schedule = sm.getScheduleById(id_Schedule);
                trangThai = rs.getBoolean("trangThai");
                idSeat = rs.getInt("idSeat");
                // Create Seat object
                Seat seat = new Seat(name, Schedule, idSeat, trangThai);
                seatList.add(seat);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SeatDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return seatList;
    }

    public static void updateSeats(ArrayList<String> selected, int id) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = """
                           UPDATE seat
                           SET trangThai = 1
                           WHERE id_Schedule = ? AND nameSeat = ?""";
            statement = conn.prepareStatement(query);
            for (String st : selected) {
                statement.setInt(1, id);
                statement.setString(2, st);
                statement.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SeatDAO.class.getName()).log(Level.SEVERE, null, ex);
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
                e.printStackTrace();
            }
        }
    }

    public void addSeat(int scheduleId) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        try {
            conn = db.openConnection();
            String query;
            for (int i = 1; i <= 63; i++) {
                query = "INSERT INTO seat(id_Schedule,idSeat,nameSeat,trangThai) VALUES (?,?,?,0)";
                statement = conn.prepareStatement(query);
                statement.setInt(1, scheduleId);
                statement.setInt(2, i);
                statement.setString(3, getSeatName(i));
                statement.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SeatDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String getSeatName(int seatNumber) {
        char row = (char) ('A' + (seatNumber - 1) / 9);
        int column = ((seatNumber - 1) % 9) + 1;
        return row + String.valueOf(column);
    }
}
