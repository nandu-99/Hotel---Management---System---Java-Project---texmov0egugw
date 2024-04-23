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

                <a href="index.html">Back to Booking Page</a>
                <footer>
                    <p>Hotel Management System © 2024</p>
                </footer>
            </body>
        </html>
