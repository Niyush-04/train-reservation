package com.trainreservation.controller;

import java.io.IOException;
import java.util.List;

import com.trainreservation.dao.TrainDAO;
import com.trainreservation.model.Train;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    TrainDAO trainDao = new TrainDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fromStation = request.getParameter("fromStation");
        String toStation = request.getParameter("toStation");
        String journeyDate = request.getParameter("journeyDate");

        //Using by default date bcs of limited database.
        List<Train> trains = trainDao.searchTrains(fromStation, toStation, "2024-07-01");

        request.setAttribute("fromStation", fromStation);
        request.setAttribute("toStation", toStation);
        request.setAttribute("journeyDate", journeyDate);
        request.setAttribute("trains", trains);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
