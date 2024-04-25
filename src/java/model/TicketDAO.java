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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class TicketDAO {

    public static ArrayList<Ticket> getAllTickets() {
        ArrayList<Ticket> TicketList = new ArrayList<>();
        int MaVe;
        String MaPhong, dateTime;
        int TrangThai, soluong;
        //another attribute
        int Nomovie, idUser, ScheduleId, totalPrice;
        Schedule schedule;
        Movie mv;
        Account user;
        //manager
        MovieManager mn = new MovieManager();
        ScheduleManager sm = new ScheduleManager();
        AccountManager am = new AccountManager();
        //----------------------------------------------------------------
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [DonHang]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                MaVe = rs.getInt("id");
                idUser = rs.getInt("id_User");
                MaPhong = rs.getString("maPhong");
                dateTime = rs.getString("thoigian");
                TrangThai = rs.getInt("trangthai");
                soluong = rs.getInt("soLuongVe");
                Nomovie = rs.getInt("id_Phim");
                ScheduleId = rs.getInt("xuatChieu");
                totalPrice = rs.getInt("totalPrice");
                schedule = sm.getScheduleById(ScheduleId);
                mv = mn.getMovieById(Nomovie);
                user = am.getAccountById(idUser);
                Ticket ticket = new Ticket(MaVe, user, MaPhong, TrangThai, soluong, mv, schedule, totalPrice, dateTime);
                TicketList.add(ticket);
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
        return TicketList;
    }

    public static void AddTickets(Ticket tk) {
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTime = currentTime.format(formatter);
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = """
                           INSERT INTO [DonHang] ([id_User], [id_Phim], [xuatChieu], [maPhong], [soLuongVe], [trangthai],totalPrice, [thoigian])
                           VALUES
                               (?, ?, ?, ?, ?, ?, ?, ?)""";
            statement = conn.prepareStatement(query);
            statement.setInt(1, tk.getUser().getId());
            statement.setInt(2, tk.getMovie().getNo());
            statement.setInt(3, tk.getSchedule().getScheduleID());
            statement.setString(4, tk.getMaPhong());
            statement.setInt(5, tk.getSoluong());
            statement.setInt(6, tk.getTrangThai());
            statement.setInt(7, tk.getTotalPrice());
            statement.setString(8, formattedTime);
            statement.executeUpdate();

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
    }
}
