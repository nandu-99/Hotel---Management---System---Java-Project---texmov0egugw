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
    <div>
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
    
    <a href="customerProfile.jsp">Back to Customer Page</a>
    <footer>
        <p>Hotel Management System © 2024</p>
    </footer>
</body>
</html>
