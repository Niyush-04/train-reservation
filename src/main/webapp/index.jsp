<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trainreservation.model.Train" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainGo - Home</title>
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body>
    <div class="background-section">
        <header>
            <div class="logo">
                <h2>TrainGo</h2>
            </div>
            <nav id="navnav">
                <div class="nav-container">
                    <button class="hamburger" id="hamburger">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <ul class="navigation-menu" id="menu">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="#">Search</a></li>
                        <li><a href="signup.jsp">Register</a></li>
                        <li><a href="login.jsp">Sign In</a></li>
                    </ul>
                    <div class="nav-overlay" id="navOverlay"></div>
                </div>
            </nav>   
        </header>
        
        <div class="slideshow-container">
            <div class="mySlides fade">
                <img src="res/background1.jpg" alt="Train journey">
            </div>
            
            <div class="mySlides fade">
                <img src="res/background2.jpg" alt="Train station">
            </div>
            
            <div class="mySlides fade">
                <img src="res/background3.jpg" alt="Scenic route">
            </div>
            
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
            
            <div class="dot-container">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
            </div>
        </div>
        
        <div class="search-overlay">
            <div class="search-container">
                <form action="index" method="post" class="search-form">
                    <h2>Search Trains</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fromStation">From Station</label>
                            <input type="text" id="fromStation" name="fromStation" list="stations" placeholder="e.g. New Delhi" required onchange="validateStations()">
                        </div>
        
                        <div class="form-group">
                            <label for="toStation">To Station</label>
                            <input type="text" id="toStation" name="toStation" list="stations" placeholder="e.g. Mumbai" required onchange="validateStations()">
                        </div>
        
                        <div class="form-group">
                            <label for="journeyDate">Journey Date</label>
                            <input type="date" id="journeyDate" name="journeyDate" required>
                        </div>
                    </div>
        
                    <datalist id="stations">
                        <option value="Agra">
                        <option value="Banaras">
                        <option value="Bangalore">
                        <option value="Chennai">
                        <option value="Delhi">
                        <option value="Gwalior">
                        <option value="Jhansi">
                        <option value="Lucknow">
                        <option value="Mumbai">
                        <option value="Sithouli">
                    </datalist>
        
                    <div class="form-group">
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
                                <div>
                                <p class="train-number">Train <%= train.getTrainNo() %></p>
                                <h4 class="train-name"><%= train.getTrainName() %></h4>
                            </div>
                            <div>
                                <h2>Fare: <%= train.getFare() %>/-</h2>
                            </div>
                                <div><button type="submit" id="BookNow" onclick="showAlert()">Book Now</button></div>
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
        <h2>Why Choose Us</h2>
        <div class="features-container" id="featuresContainer">
            <div class="feature-card">
                <img src="res/no_payment_gateway_fee.png" alt="No Payment Gateway Fee">
                <h3>No Payment Gateway Fee</h3>
                <p>Zero Payment Gateway Charges via UPI mode</p>
            </div>
            <div class="feature-card">
                <img src="res/free_cancellation.png" alt="Free Cancellation">
                <h3>Free Cancellation</h3>
                <p>Get a full refund on your ticket cancellation</p>
            </div>
            <div class="feature-card">
                <img src="res/expert_customer_suport.png" alt="Support">
                <h3>100% Accurate Predictions</h3>
                <p>Know your chances of ticket confirmation</p>
            </div>
            <div class="feature-card">
                <img src="res/expert_customer_suport.png" alt="Support">
                <h3>100% Accurate Predictions</h3>
                <p>Know your chances of ticket confirmation</p>
            </div>
            <div class="feature-card">
                <img src="res/expert_customer_suport.png" alt="Support">
                <h3>100% Accurate Predictions</h3>
                <p>Know your chances of ticket confirmation</p>
            </div>
            <div class="feature-card">
                <img src="res/expert_customer_suport.png" alt="Support">
                <h3>100% Accurate Predictions</h3>
                <p>Know your chances of ticket confirmation</p>
            </div>
        </div>
        <div class="scroll-indicators" id="scrollIndicators"></div>
    </div>

    <footer class="footer">
        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Blog</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h3>Support</h3>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h3>Follow Us</h3>
            <ul>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
        
        <div class="footer-column">
            <h2>TrainGo.Co</h2>
            <p>ITM College, Gwalior</p>
            <p>Phone: 123-456-789</p>
            <p>contact@traingo.co</p>
        </div>
        
        <div class="copyright">
            <p>&copy; 2025 TrainGo. All rights reserved.</p>
        </div>
    </footer>
</div>

<script>
    // Mobile Menu Toggle
    const hamburger = document.getElementById('hamburger');
    const menu = document.getElementById('menu');
    const navOverlay = document.getElementById('navOverlay');
    
    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        menu.classList.toggle('show');
        navOverlay.classList.toggle('active');
        document.body.classList.toggle('menu-open');
    });

    // Close menu when clicking overlay or links
    navOverlay.addEventListener('click', closeMenu);
    document.querySelectorAll('.navigation-menu a').forEach(link => {
        link.addEventListener('click', closeMenu);
    });

    function closeMenu() {
        hamburger.classList.remove('active');
        menu.classList.remove('show');
        navOverlay.classList.remove('active');
        document.body.classList.remove('menu-open');
    }

    // Slideshow Functionality
    let slideIndex = 1;
    showSlides(slideIndex);
    
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }
    
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }
    
    function showSlides(n) {
        const slides = document.getElementsByClassName("mySlides");
        const dots = document.getElementsByClassName("dot");
        
        if (n > slides.length) slideIndex = 1;
        if (n < 1) slideIndex = slides.length;
        
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
        }
        
        for (let i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
    }
    
    // Auto slide change
    setInterval(() => plusSlides(1), 5000);

    // Features Slider Indicators
    const featuresContainer = document.getElementById('featuresContainer');
    const scrollIndicators = document.getElementById('scrollIndicators');
    const featureCards = document.querySelectorAll('.feature-card');
    
    // Create indicators
    featureCards.forEach((_, index) => {
        const indicator = document.createElement('div');
        indicator.className = 'scroll-indicator';
        if (index === 0) indicator.classList.add('active');
        indicator.addEventListener('click', () => scrollToFeature(index));
        scrollIndicators.appendChild(indicator);
    });
    
    function scrollToFeature(index) {
        const cardWidth = featureCards[0].offsetWidth + 20;
        featuresContainer.scrollTo({
            left: index * cardWidth,
            behavior: 'smooth'
        });
        updateActiveIndicator(index);
    }
    
    function updateActiveIndicator(index) {
        document.querySelectorAll('.scroll-indicator').forEach((indicator, i) => {
            indicator.classList.toggle('active', i === index);
        });
    }
    
    // Hide indicators on desktop
    function handleResize() {
        scrollIndicators.style.display = window.innerWidth >= 769 ? 'none' : 'flex';
    }
    
    window.addEventListener('resize', handleResize);
    handleResize();

    function showAlert() {
        alert("Please sign in before booking your ticket to continue with your reservation. Thank you ");
    }

</script>
</body>
</html>