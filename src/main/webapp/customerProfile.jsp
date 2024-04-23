<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Customer Profile</h1>
    </header>
    <form action="CustomerServlet" method="post">
        <label for="customerId">Customer ID:</label>
        <input type="text" id="customerId" name="customerId" required>
        <button type="submit">Retrieve Profile</button>
    </form>
    <form action="CustomerServlet" method="post">
        <input type="hidden" name="allCustomers" value="true">
        <button type="submit">Retrieve All Customers</button>
    </form>
    <footer>
        <p>Hotel Management System © 2024</p>
    </footer>
</body>
</html>
