package com.trainreservation.controller;

import java.io.IOException;

import com.trainreservation.dao.UserDAO;
import com.trainreservation.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("dashboard.jsp");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO userDao = new UserDAO();
            User user = userDao.validateUser(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("username", user.getUsername());

                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
    }

}
