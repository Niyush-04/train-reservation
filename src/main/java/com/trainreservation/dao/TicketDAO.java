package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.trainreservation.model.Ticket;

public class TicketDAO {

    public boolean bookTicket(Ticket ticket) {
        String query = "INSERT INTO tickets (pnr, username, train_no, journey_date, source, destination, total_fare, total_seats) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, ticket.getPnr());
            pstmt.setString(2, ticket.getUsername());
            pstmt.setString(3, ticket.getTrainNo());
            pstmt.setString(4, ticket.getDate());
            pstmt.setString(5, ticket.getSource());
            pstmt.setString(6, ticket.getDestination());
            pstmt.setString(7, ticket.getTotalFare());
            pstmt.setInt(8, ticket.getTotalSeats());

            int rowAffected = pstmt.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
