<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainGo - Booking</title>
    <link rel="stylesheet" href="bookingStyles.css">
</head>
<body>
    <%
        HttpSession bookingSession = request.getSession(false);
        if (bookingSession == null || bookingSession.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String username = (String) bookingSession.getAttribute("username");
            String email = (String) bookingSession.getAttribute("email");
            String trainNo = request.getParameter("trainNo");
            String trainName = request.getParameter("trainName");
            String journeyDate = request.getParameter("journeyDate");
            String availableSeats = request.getParameter("availableSeats");
            String fare = request.getParameter("fare");
            String source = request.getParameter("source");
            String destination = request.getParameter("destination");
    %>
    <header>
        <h2>TrainGo - Confirm Booking</h2>
    </header>

    <div class="booking-container">
        <h3>Booking Details</h3>
        <p><strong>User Name:</strong> <%= username %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Train No:</strong> <%= trainNo %></p>
        <p><strong>Train Name:</strong> <%= trainName %></p>
        <p><strong>Journey Date:</strong> <%= journeyDate %></p>
        <p><strong>Seats Available:</strong> <%= availableSeats %></p>
        <p><strong>Base Fare:</strong> <span id="baseFare"><%= fare %></span></p>
        <p class="total-fare"><strong>Total Fare:</strong> <span id="totalFare"><%= fare %></span></p>

        <form action="confirmbooking" method="post">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="trainNo" value="<%= trainNo %>">
            <input type="hidden" name="journeyDate" value="<%= journeyDate %>">
            <input type="hidden" name="totalFare" value="<%= fare %>">
            <input type="hidden" name="source" value="<%= source %>">
            <input type="hidden" name="destination" value="<%= destination %>">


            
            <h3>Passenger Details</h3>
            
            <label for="passenger1Name">Passenger 1 Name:</label>
            <input type="text" id="passenger1Name" name="passenger1Name" required>
            <label for="passenger1Age">Passenger 1 Age:</label>
            <input type="number" id="passenger1Age" name="passenger1Age" required>
            <label for="passenger1Gender">Passenger 1 Gender:</label>
            <select id="passenger1Gender" name="passenger1Gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <br><br>

            <label for="passenger2Name">Passenger 2 Name:</label>
            <input type="text" id="passenger2Name" name="passenger2Name">
            <label for="passenger2Age">Passenger 2 Age:</label>
            <input type="number" id="passenger2Age" name="passenger2Age">
            <label for="passenger2Gender">Passenger 2 Gender:</label>
            <select id="passenger2Gender" name="passenger2Gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <br><br>

            <label for="passenger3Name">Passenger 3 Name:</label>
            <input type="text" id="passenger3Name" name="passenger3Name">
            <label for="passenger3Age">Passenger 3 Age:</label>
            <input type="number" id="passenger3Age" name="passenger3Age">
            <label for="passenger3Gender">Passenger 3 Gender:</label>
            <select id="passenger3Gender" name="passenger3Gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <br><br>

            <button type="submit">Confirm Booking</button>
        </form>
    </div>
    
    <script src="bookingScript.js"></script>
    <% } %>
</body>
</html>