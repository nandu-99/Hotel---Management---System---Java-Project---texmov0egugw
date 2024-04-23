<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="hotelManagement.Customer" %>
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
        <h1>Customer Profiles</h1>
    </header>
    <div>
        <% 
        List<Customer> allCustomers = (List<Customer>) request.getAttribute("allCustomers");
        if (allCustomers == null || allCustomers.isEmpty()) { %>
            <p>No customers found.</p>
        <% } else { %>
            <table>
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Customer customer : allCustomers) { %>
                        <tr>
                            <td><%= customer.getCustomerId() %></td>
                            <td><%= customer.getName() %></td>
                            <td><%= customer.getContactInfo().getPhone() %></td>
                            <td><%= customer.getContactInfo().getEmail() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
    
    <a href="customerProfile.jsp">Back to Customer Page</a>
    <footer>
        <p>Hotel Management System © 2024</p>
    </footer>
</body>
</html>
