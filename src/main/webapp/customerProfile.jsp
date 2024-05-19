<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="styles.css">
	<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        button {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 50%;
            box-sizing: border-box;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }
        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
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
