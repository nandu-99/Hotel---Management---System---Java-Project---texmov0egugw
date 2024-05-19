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
        .main {
            margin: 20px auto;
            width: 80%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        p {
            margin-bottom: 10px;
        }
        strong {
            font-weight: bold;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            border: 2px solid #4CAF50;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #45a049;
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
    <div class="main">
        <c:if test="${empty customer}">
            <p>No customer found with the given ID.</p>
        </c:if>
        <c:if test="${not empty customer}">
            <p><strong>Customer ID:</strong> ${customer.customerId}</p>
            <p><strong>Name:</strong> ${customer.name}</p>
            <p><strong>Contact Information:</strong></p>
            <p>Phone: ${customer.contactInfo.phone}</p>
            <p>Email: ${customer.contactInfo.email}</p>
        </c:if>
    </div>
    <div class="button-container">
    <a href="customerProfile.jsp" class="button">Back to Customer Page</a>
    </div>
    <footer>
        <p>Hotel Management System © 2024</p>
    </footer>
</body>
</html>
