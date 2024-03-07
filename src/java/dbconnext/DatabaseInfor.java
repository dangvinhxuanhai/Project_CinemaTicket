/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dbconnext;

/**
 *
 * @author lenovo
 */
public interface DatabaseInfor {

    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Ws4;";

    String user = "sa";
    String pass = "123"; 
}
