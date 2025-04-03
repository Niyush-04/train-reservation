package com.trainreservation.controller;

import java.io.IOException;

import com.trainreservation.dao.TicketDAO;
import com.trainreservation.model.Ticket;
import com.trainreservation.util.PNRGenerator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/confirmbooking")
public class ConfirmBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String pnr = PNRGenerator.generatePNR();
        String trainNo = req.getParameter("trainNo");
        String date = req.getParameter("journeyDate");
        String source = req.getParameter("source");
        String destination = req.getParameter("destination");
        String totalFare = req.getParameter("totalFare");
        int totalSeats = 1;

        Ticket ticket = new Ticket(username, pnr, trainNo, date, source, destination, totalFare, totalSeats);

        TicketDAO ticketDAO = new TicketDAO();

        boolean isTicketBooked = ticketDAO.bookTicket(ticket);

        if (isTicketBooked) {
            req.setAttribute("pnr", pnr);
            req.getRequestDispatcher("confirmBooking.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("error.jsp");
        }
    }
}
