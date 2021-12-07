package databaseConnection;


import java.sql.*;

public class DatabaseConnection {

    public static String test() {
        return "zxc";
    }
    public static Connection getConnection() {
        Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost/test2";
        String user = "root";
        String pass = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(
                    "jdbc:mysql://localhost/test2", "root", "");
        }  catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            return conn;
        }
    }

    public void getTestData() {
        Connection conn = DatabaseConnection.getConnection();
        Statement s = null;
        try {
            s = conn.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM sneakersman");
            while (rs.next()) {
                String r1 = rs.getString(1);//read by column index
                String r2 = rs.getString("name");//read by column name
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
