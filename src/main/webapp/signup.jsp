<!DOCTYPE html>
<html>
<head>
    <title>Signup Page</title>
</head>
<body>
    <h2>Signup</h2>

    <form action="signup" method="post">
        <label>Full Name:</label>
        <input type="text" name="fullName" required><br>

        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Phone:</label>
        <input type="text" name="phone" required><br>

        <label>Username:</label>
        <input type="text" name="username" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <button type="submit">Signup</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html>
