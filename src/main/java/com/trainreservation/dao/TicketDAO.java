package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.trainreservation.model.Ticket;

public class TicketDAO {

    public boolean bookTicket(Ticket ticket) {
        String query = "INSERT INTO train_tickets (pnr, username, train_no, travel_date, source, destination, total_fare, total_seats, p1_name, p1_age, p1_gender, p1_seats_no, p2_name, p2_age, p2_gender, p2_seats_no, p3_name, p3_age, p3_gender, p3_seats_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, ticket.getPnr());
            pstmt.setString(2, ticket.getUsername());
            pstmt.setString(3, ticket.getTrainNo());
            pstmt.setString(4, ticket.getDate());
            pstmt.setString(5, ticket.getSource());
            pstmt.setString(6, ticket.getDestination());
            pstmt.setString(7, ticket.getTotalFare());
            pstmt.setString(8, ticket.getTotalSeats());
            pstmt.setString(9, ticket.getP1_name());
            pstmt.setString(10, ticket.getP1_age());
            pstmt.setString(11, ticket.getP1_gender());
            pstmt.setString(12, ticket.getP1_seatNo());
            pstmt.setString(13, ticket.getP2_name());
            pstmt.setString(14, ticket.getP2_age());
            pstmt.setString(15, ticket.getP2_gender());
            pstmt.setString(16, ticket.getP2_seatNo());
            pstmt.setString(17, ticket.getP3_name());
            pstmt.setString(18, ticket.getP3_age());
            pstmt.setString(19, ticket.getP3_gender());
            pstmt.setString(20, ticket.getP3_seatNo());

            int rowAffected = pstmt.executeUpdate();
            return rowAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

}
