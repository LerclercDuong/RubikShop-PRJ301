/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author doant
 */
public class DBUtils {
    private static final String USERNAME= "sa";
    private static final String PASSWORD = "12345";
    private static final String DBName = "UserManagement";

    public static Connection getConnection() throws ClassNotFoundException, SQLException{    
            Connection con;
            String url = "jdbc:sqlserver://localhost:1433;databaseName="+DBName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, USERNAME, PASSWORD);
            return con;
    }
}
