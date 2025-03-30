<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trainreservation.model.Train" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Train Reservation System</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .container { max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Search Trains</h2>
        <form action="index" method="post">
            <label for="fromStation">From Station:</label>
            <input type="text" id="fromStation" name="fromStation" required><br><br>

            <label for="toStation">To Station:</label>
            <input type="text" id="toStation" name="toStation" required><br><br>

            <label for="journeyDate">Journey Date:</label>
            <input type="date" id="journeyDate" name="journeyDate" required><br><br>

            <input type="submit" value="Search">
        </form>
    </div>

    <%
        String fromStation = (String) request.getAttribute("fromStation");
        String toStation = (String) request.getAttribute("toStation");
        String journeyDate = (String) request.getAttribute("journeyDate");
        List<Train> trains = (List<Train>) request.getAttribute("trains");
    %>

    <% if (trains != null && !trains.isEmpty()) { %>
        <h3>Trains from <%= fromStation %> to <%= toStation %> on <%= journeyDate %></h3>
        <table>
            <tr>
                <th>Train Number</th>
                <th>Train Name</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Seats Available</th>
            </tr>
            <% for (Train train : trains) { %>
                <tr>
                    <td><%= train.getTrainNo() %></td>
                    <td><%= train.getTrainName() %></td>
                    <td><%= train.getDepartureTime() %></td>
                    <td><%= train.getArrivalTime() %></td>
                    <td><%= train.getSeatsAvailable() %></td>
                </tr>
            <% } %>
        </table>
    <% } else if (trains != null) { %>
        <p>No trains available for this route on the selected date.</p>
    <% } %>

</body>
</html>
