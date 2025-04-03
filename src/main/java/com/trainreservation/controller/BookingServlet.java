package com.trainreservation.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");

        String trainNo = request.getParameter("trainNo");
        String trainName = request.getParameter("trainName");
        String journeyDate = request.getParameter("journeyDate");
        String availableSeats = request.getParameter("availableSeats");
        String fare = request.getParameter("fare");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("trainNo", trainNo);
        request.setAttribute("trainName", trainName);
        request.setAttribute("journeyDate", journeyDate);
        request.setAttribute("availableSeats", availableSeats);
        request.setAttribute("fare", fare);
        request.setAttribute("source", source);
        request.setAttribute("destination", destination);

        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }
}
