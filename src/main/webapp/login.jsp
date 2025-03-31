<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TrainGo - Login</title>
    <link rel="stylesheet" href="styles.css" />
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
        <h2>Login</h2>

        <% if(request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
          <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %> <% if(request.getAttribute("successMessage") != null) { %>
        <div class="success-message">
          <%= request.getAttribute("successMessage") %>
        </div>
        <% } %>

        <form action="login" method="post" class="search-form">
          <div class="form-group">
            <label for="username">Username</label>
            <input
              type="text"
              id="username"
              name="username"
              placeholder="name"
              required
            />
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />
          </div>

          <div class="form-group submit-group">
            <button type="submit" class="search-button">Login</button>
          </div>

          <div class="form-footer">
            <p>Don't have an account? <a href="signup">Sign Up</a></p>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
