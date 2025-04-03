package com.trainreservation.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve user details
        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");

        // Retrieve train details
        String trainNo = request.getParameter("trainNo");
        String trainName = request.getParameter("trainName");
        String journeyDate = request.getParameter("journeyDate");
        String availableSeats = request.getParameter("availableSeats");
        String fare = request.getParameter("fare");

        // Set attributes for JSP
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("trainNo", trainNo);
        request.setAttribute("trainName", trainName);
        request.setAttribute("journeyDate", journeyDate);
        request.setAttribute("availableSeats", availableSeats);
        request.setAttribute("fare", fare);

        // Forward request to JSP
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }
}
