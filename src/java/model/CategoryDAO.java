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
public class CategoryDAO {

    public static ArrayList<Category> getAllCategorys() {
        ArrayList<Category> CategoryList = new ArrayList<>();
        int categoryID;
        String name;
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = "SELECT * FROM Category";
            statement = conn.prepareStatement(query);
            rs = statement.executeQuery();
            while (rs.next()) {
                categoryID = rs.getInt("CategoryID");
                name = rs.getString("Name");

                Category category = new Category(categoryID,name);
                CategoryList.add(category);
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
        return CategoryList;
    }
}
