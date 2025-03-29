package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.trainreservation.model.User;

public class UserDAO {

    public boolean registerUser(User user) {
        String query = "INSERT INTO users (username, password, full_name, email, phone) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getFullName());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());

            int rowAffected = pstmt.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User validateUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ?";

        try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, username);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    if (password.equals(storedPassword)) {
                        User user = new User();
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password"));
                        user.setFullName(rs.getString("full_name"));
                        user.setEmail(rs.getString("email"));
                        user.setPhone(rs.getString("phone"));
                        user.setRegistrationDate(rs.getString("registration_date"));
                        return user;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
