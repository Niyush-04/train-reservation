package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<Ticket> getTicketsByUser(String username) {

        List<Ticket> tickets = new ArrayList<>();

        String query = "SELECT * FROM tickets WHERE username = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstm = conn.prepareStatement(query)) {
            pstm.setString(1, username);

            try (ResultSet rs = pstm.executeQuery()) {
                while (rs.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setusername(rs.getString("username"));
                    ticket.setPnr(rs.getString("pnr"));
                    ticket.setTrainNo(rs.getString("train_no"));
                    ticket.setDate(rs.getString("journey_date"));
                    ticket.setSource(rs.getString("source"));
                    ticket.setDestination(rs.getString("destination"));
                    ticket.setTotalFare(rs.getString("total_fare"));
                    ticket.setTotalSeats(rs.getInt("total_seats"));
                    tickets.add(ticket);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }
}
