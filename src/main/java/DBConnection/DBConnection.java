package DBConnection;

import com.mysql.jdbc.Driver;

import java.sql.*;

public class DBConnection {

    Connection connection = null;

    public DBConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url= "jdbc:mysql://localhost:3306/onlinemeatshop";
            String userName= "root";
            String password = "";
            this.connection = DriverManager.getConnection(url, userName, password);
            System.out.println("Database connected: ");
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        }


    public static void main(String[] args) {
        DBConnection connection = new DBConnection();
    }

    public PreparedStatement getStatement(String query){
        PreparedStatement preparedStatement = null;

        try{
            preparedStatement = connection.prepareStatement(query);

        }catch (SQLException e){
            e.printStackTrace();
        }
        return preparedStatement;
    }


}
