<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Train Reservation System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Train Reservation System</h1>
        </div>
        
        <div class="content">
            <div class="form-container">
                <h2>Login</h2>
                
                <% if(request.getAttribute("errorMessage") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <% if(request.getAttribute("successMessage") != null) { %>
                    <div class="success-message">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
                
                <form action="login" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn-primary">Login</button>
                    </div>
                </form>
                
                <div class="form-footer">
                    <p>Don't have an account? <a href="signup">Sign Up</a></p>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>&copy; 2025 Train Reservation System</p>
        </div>
    </div>
</body>
</html>