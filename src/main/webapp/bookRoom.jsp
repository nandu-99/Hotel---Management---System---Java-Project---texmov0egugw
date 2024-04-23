<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="hotelManagement.Customer, hotelManagement.Room"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book a Room</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <header>
            <h1>Book a Room</h1>
        </header>
        <form action="" method="post">
            <div>
                <label for="customerId">Select Customer:</label>
                <select name="customerId" required>
                    <option value="">Select a Customer</option>
                    <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                       for (Customer customer : customers) {
                    %>
                        <option value="<%= customer.getCustomerId() %>"><%= customer.getName() %></option>
                    <% } %>
                </select>
            </div>
            <div>
                <label for="roomNumber">Select Room:</label>
                <select name="roomNumber" required>
                    <option value="">Select a Room</option>
                    <% List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                       for (Room room : rooms) {
                           if ("available".equals(room.getStatus())) {
                    %>
                        <option value="<%= room.getRoomNumber() %>"><%= room.getRoomNumber() %> - <%= room.getType() %></option>
                    <%      }
                       }
                    %>
                </select>
            </div>
            <div>
                <label for="checkIn">Check-In Date:</label>
                <input type="date" name="checkIn" required>
            </div>
            <div>
                <label for="checkOut">Check-Out Date:</label>
                <input type="date" name="checkOut" required>
            </div>
            <button type="submit">Book Room</button>
        </form>
        <footer>
            <p>Hotel Management System © 2024</p>
        </footer>
    </body>
</html>
