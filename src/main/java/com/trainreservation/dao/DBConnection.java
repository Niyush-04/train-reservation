package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/train_reservation";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "221438"; //sahi hai?oks

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USERNAME, DB_PASSWORD);
    }

    public static void closeConnection(Connection connection) throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

}
