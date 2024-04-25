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
public class MovieDAO {

    public static ArrayList<Movie> getAllMovies() {
        ArrayList<Movie> movieList = new ArrayList<>();
        CategoryManager cm = new CategoryManager();
        int no, length, CategoryId1, CategoryId2;
        String name;
        String url, url2;
        String introduce, actor, Premiere, Directors;
        Category Category1, Category2;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM [Phim]";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                no = rs.getInt("id");
                length = rs.getInt("Length");
                name = rs.getString("tenPhim");
                url = rs.getString("hinhAnh");
                url2 = rs.getString("hinhAnh2");
                introduce = rs.getString("introduce");
                actor = rs.getString("actor");
                Premiere = rs.getString("Premiere");
                CategoryId1 = rs.getInt("CategoryId1");
                Category1 = cm.getCategoryById(CategoryId1);
                CategoryId2 = rs.getInt("CategoryId2");
                Category2 = cm.getCategoryById(CategoryId2);
                Directors = rs.getString("Directors");

                Movie movie = new Movie(no, length, name, url, url2, introduce, actor, Premiere, Directors, Category1, Category2);
                movieList.add(movie);
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
        return movieList;
    }

    public void updateMovie(Movie mv) {
        String sql = """
                     UPDATE [webcinemal].[dbo].[Phim]
                     SET tenPhim=? , hinhAnh=?,hinhAnh2=?, introduce = ?, actor=?,Length=?,Premiere=?,CategoryId1=?,CategoryId2=?,Directors=?
                     WHERE id = ? """;
        ConnectDB db = ConnectDB.getInstance();
        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, mv.getName());
            statement.setString(2, mv.getUrl());
            statement.setString(3, mv.getUrl2());
            statement.setString(4, mv.getIntroduce());
            statement.setString(5, mv.getActor());
            statement.setString(7, mv.getPremiere());
            statement.setInt(8, mv.getCategory1().getCategoryID());
            statement.setInt(9, mv.getCategory2().getCategoryID());
            statement.setString(10, mv.getDirectors());
            statement.setInt(6, mv.getLenght());
            statement.setInt(11, mv.getNo());
            statement.executeUpdate();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteDonhang(String No) {
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to execute the sql comments
            String sql = "delete from DonHang where id_Phim=?;";
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
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deletSchedule(String No) {
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to execute the sql comments
            String sql = """
                         DELETE FROM seat
                         WHERE id_Schedule IN (SELECT ScheduleID FROM Schedule WHERE MovieID = ?);DELETE FROM Schedule WHERE MovieID=?""";
            PreparedStatement statement = con.prepareStatement(sql);
            // convert String id to int id
            int id = Integer.parseInt(No);
            // set parameter in the sql
            statement.setInt(1, id);
            statement.setInt(2, id);
            // execute the sql
            statement.execute();
            con.close();
            statement.close();

        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void deleteMovie(String No) {
        // create the connection
        try {
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            // prepare the statement in order to execute the sql comments
            String sql = "DELETE FROM Phim WHERE id=?";
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
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void addMovie(Movie mv) {
        // create sql for insert
        String sql = """
                     INSERT INTO [Phim] ([tenPhim], [hinhAnh],[hinhAnh2],introduce,actor,Length,Premiere,CategoryId1,CategoryId2,Directors)
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);""";
        ConnectDB db = ConnectDB.getInstance();

        try {
            Connection con = db.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, mv.getName());
            statement.setString(2, mv.getUrl());
            statement.setString(3, mv.getUrl2());
            statement.setString(4, mv.getIntroduce());
            statement.setString(5, mv.getActor());
            statement.setString(7, mv.getPremiere());
            statement.setInt(8, mv.getCategory1().getCategoryID());
            statement.setInt(9, mv.getCategory2().getCategoryID());
            statement.setString(10, mv.getDirectors());
            statement.setInt(6, mv.getLenght());

            statement.executeUpdate();

            statement.close();
            con.close();

        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
