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
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        select, input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
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
