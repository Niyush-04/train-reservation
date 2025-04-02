<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trainreservation.model.Train" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainGo - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="dashboard.css">
</head>
<body>
    <header>
        <div class="logo">
            <h2>TrainGo</h2>
        </div>
        <div class="user-info">
            <p>${email}</p>
            <button type="submit" class="btn btn-outline" id="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                </svg>
                Logout
            </button>
        </div>
    </header>

    <div class="greeting">
        <h1>Good Morning, ${username}!</h1>
        <p>Find your perfect train journey</p>
    </div>

    <div class="search-container">
        <form action="dashboard" method="post" class="search-form">
            <h2>Search Trains</h2>
            <div class="form-row">
                <div class="form-group">
                    <label for="fromStation">From Station</label>
                    <input type="text" class="form-control" id="fromStation" name="fromStation" placeholder="e.g. New Delhi" required>
                </div>
                
                <div class="form-group">
                    <label for="toStation">To Station</label>
                    <input type="text" class="form-control" id="toStation" name="toStation" placeholder="e.g. Mumbai" required>
                </div>
                
                <div class="form-group">
                    <label for="journeyDate">Journey Date</label>
                    <input type="date" class="form-control" id="journeyDate" name="journeyDate" required>
                </div>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary" style="width: 100%; padding: 0.75rem;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" style="margin-right: 8px;">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                    Search Trains
                </button>
            </div>
        </form>
    </div>

<!-- show train list -->

<%
    String fromStation = (String) request.getAttribute("fromStation");
    String toStation = (String) request.getAttribute("toStation");
    String journeyDate = (String) request.getAttribute("journeyDate");
    List<Train> trains = (List<Train>) request.getAttribute("trains");
    %>

    <div class="results-container">
        <% if (trains != null && !trains.isEmpty()) { %>
            <h3>Trains from <%= fromStation != null ? fromStation : "" %> to <%= toStation != null ? toStation : "" %> on <%= journeyDate != null ? journeyDate : "" %></h3>
            
            <div class="train-cards">
                <% for (Train train : trains) { %>
                    <div class="train-card">
                        <div class="train-header">
                            <div>
                            <p class="train-number">Train <%= train.getTrainNo() %></p>
                            <h4 class="train-name"><%= train.getTrainName() %></h4>
                        </div>
                        <div>
                            <h2>Fare: <%= train.getFare() %>/-</h2>
                        </div>
                            <div><button type="submit" id="BookNow">Book Now</button></div>
                        </div>
                        <div class="train-body">
                            <div class="train-time">
                                <div class="departure">
                                    <div class="time-label">DEPARTURE</div>
                                    <div class="time-value"><%= train.getDepartureTime() %></div>
                                </div>
                                <div class="time-connector"></div>
                                <div class="arrival">
                                    <div class="time-label">ARRIVAL</div>
                                    <div class="time-value"><%= train.getArrivalTime() %></div>
                                </div>
                            </div>
                            <div class="seats-available">
                                <div class="seats-label">Seats Available</div>
                                <div class="seats-value"><%= train.getSeatsAvailable() %></div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <% } else if (trains != null) { %>
            <div class="no-results">
                <p>No trains available for this route on the selected date.</p>
            </div>
        <% } %>
    </div>

</body>
</html> 