<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainGo - Booking</title>
</head>
<body>
    <%
        HttpSession session1 = request.getSession(false);
        if (session1 == null || session1.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String username = (String) session1.getAttribute("username");
            String email = (String) session1.getAttribute("email");
            String trainNo = request.getParameter("trainNo");
            String trainName = request.getParameter("trainName");
            String journeyDate = request.getParameter("journeyDate");
            String availableSeats = request.getParameter("availableSeats");
            String fare = request.getParameter("fare");
    %>
    <header>
        <h2>TrainGo - Confirm Booking</h2>
    </header>

    <div class="booking-container">
        <h3>Booking Details</h3>
        <p><strong>Passenger Name:</strong> <%= username %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Train No:</strong> <%= trainNo %></p>
        <p><strong>Train Name:</strong> <%= trainName %></p>
        <p><strong>Journey Date:</strong> <%= journeyDate %></p>
        <p><strong>Seats Available:</strong> <%= availableSeats %></p>
        <p><strong>Fare:</strong> ₹<%= fare %></p>

        <form action="confirmBookingServlet" method="post">
            <input type="hidden" name="trainNo" value="<%= trainNo %>">
            <input type="hidden" name="trainName" value="<%= trainName %>">
            <input type="hidden" name="journeyDate" value="<%= journeyDate %>">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="fare" value="<%= fare %>">
            
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
    <% } %>
</body>
</html>
