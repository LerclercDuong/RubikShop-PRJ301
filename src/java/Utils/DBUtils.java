/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author doant
 */
public class DBUtils {

    private static final String USERNAME = "sa";
    private static final String PASSWORD = "12345";
    private static final String DBName = "UserManagement";
    private static final String DBName2 = "RubikShop";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con;
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DBName2;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection(url, USERNAME, PASSWORD);
        return con;
    }
}
