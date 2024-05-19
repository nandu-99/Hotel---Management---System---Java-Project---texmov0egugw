<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="hotelManagement.Room" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Room Overview</title>
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
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        a.button{
            display: inline-block;
            text-align: center;
            margin: 20px auto;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            border: 2px solid #4CAF50;
            padding: 10px 20px;
            border-radius: 4px;
            
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
            <h1>Room Overview</h1>
        </header>
        <div>
            <%
            List<Room> allRooms = (List<Room>) request.getAttribute("rooms");
                    if (allRooms == null || allRooms.isEmpty()) { %>
                    <p>No rooms available.</p>
                    <% } else { %>
                    <table>
                        <thead>
                            <tr>
                                <th>Room Number</th>
                                <th>Type</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Room room : allRooms) { %>
                            <tr>
                                <td><%= room.getRoomNumber() %></td>
                                <td><%= room.getType() %></td>
                                <td><%= room.getStatus() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% } %>
                </div>
				<div class="button-container">
                	<a href="index.html" class="button">Back to Booking Page</a>
                </div>
                <footer>
                    <p>Hotel Management System © 2024</p>
                </footer>
            </body>
        </html>
