<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trainreservation.model.Train" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainGo - Home</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="background-section">
        <header>
            <div class="logo">
                <!-- <img src="img/TrainGo.png" alt="TrainGo Logo"> -->
                <h2>TrainGo</h2>
            </div>
            <nav>
                <ul class="navigation-menu">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#">Search</a></li>
                    <li><a href="signup.jsp">Register</a></li>
                    <li><a href="login.jsp">Sign In</a></li>
                </ul>
            </nav>
        </header>
        <div class="search-container">
            <h2>Search Trains</h2>
            <form action="index" method="post" class="search-form">
                <div class="form-group">
                    <label for="fromStation">From Station</label>
                    <input type="text" id="fromStation" name="fromStation" placeholder="e.g. New Delhi" required>
                </div>
                
                <div class="form-group">
                    <label for="toStation">To Station</label>
                    <input type="text" id="toStation" name="toStation" placeholder="e.g. Mumbai" required>
                </div>
                
                <div class="form-group">
                    <label for="journeyDate">Journey Date</label>
                    <input type="date" id="journeyDate" name="journeyDate" required>
                </div>
                
                <div class="form-group submit-group">
                    <button type="submit" class="search-button">Search Trains</button>
                </div>
            </form>
        </div>
    </div>

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
                            <p class="train-number">Train <%= train.getTrainNo() %></p>
                            <h4 class="train-name"><%= train.getTrainName() %></h4>
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

    <div class="why-choose-us">
        <h2>Why Choose Us !!</h2>
        <div class="background-items">
            <div>
                <img src="res/no_payment_gateway_fee.png" alt="No Payment Gateway Fee">
                <h3>No Payment Gateway Fee</h3>
                <p>Zero Payment Gateway Charges via UPI mode</p>
            </div>
            <div>
                <img src="res/free_cancellation.png" alt="Free Cancellation">
                <h3>Free Cancellation</h3>
                <p>Get a full refund on your ticket cancellation.</p>
            </div>
            <div>
                <img src="res/expert_customer_suport.png" alt="Support">
                <h3>100% Accurate Predictions</h3>
                <p>Know your chances of ticket confirmation</p>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div>
            <p>&copy; 2025 TrainGo. All rights reserved.</p>
            <p>Powered by TrainGo</p>
            <p>Version 1.0</p>
            <p>Terms of Service | Privacy Policy</p>
        </div>

        <div>
            <h3>Follow Us</h3>
            <ul>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>

        <div>
            <h2>TrainGo.Co</h2>
            <p>ITM College, Gwalior</p>
            <p>Phone: 123-456-789</p>
            <p>contact@traingo.co</p>
        </div>
    </footer>
</body>
</html>