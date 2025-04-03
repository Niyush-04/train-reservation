<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TrainGo - Signup</title>
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
        <h2>Signup</h2>

        <form action="signup" method="post" class="search-form">
          <div class="form-group">
            <label for="fullName">Full Name</label>
            <input
              type="text"
              id="fullName"
              name="fullName"
              placeholder="name"
              required
            />
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email"/>
          </div>

          <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" required placeholder="Enter your phone"/>
          </div>

          <div class="form-group">
            <label for="username">Username</label>
            <input type="username" id="username" name="username" required placeholder="Enter your username"/>
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password"/>
          </div>

          <div class="form-group submit-group">
            <button type="submit" class="search-button">Sign Up</button>
          </div>

          <div class="form-footer">
            <p>Don't have an account? <a href="login.jsp">Login</a></p>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>