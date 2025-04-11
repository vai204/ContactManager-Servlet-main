<%@page import="com.jspider.ContactManager_Servlet.JDBC.ContactJDBC"%>
<%@page import="com.jspider.ContactManager_Servlet.entity.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-container {
        text-align: left;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 16px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    .message {
        text-align: center;
        margin-top: 20px;
        font-size: 18px;
    }
</style>
</head>
<body>
<div class="container" align="center">
    <div class="header">
        <h2>Contact Manager</h2>
    </div>
    <div class="form-container">
        <!-- Form for adding a new contact -->
        <form action="contact" method="post">
            <label>Id:</label>
            <input type="text" name="id"><br>
            <label>First Name:</label>
            <input type="text" name="FirstName"><br>
            <label>Last Name:</label>
            <input type="text" name="LastName"><br>
            <label>Email:</label>
            <input type="email" name="Email"><br>
            <label>Phone Number:</label>
            <input type="number" name="PhoneNumber"><br>
            <input type="submit" value="Save">
        </form>
    </div>
</div>

<div class="container" align="center">
    <!-- Displaying the contact list -->
    <h3>Contact List</h3>
    <% List<Contact> contacts = ContactJDBC.findAllContact();
       if(contacts != null && contacts.size() > 0) { %>
    <table>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Actions</th>
        </tr>
        <% for (Contact contact : contacts) { %>
        <tr>
            <td><%=contact.getId()%></td>
            <td><%=contact.getFirstName()%></td>
            <td><%=contact.getLastName()%></td>
            <td><%=contact.getEmail()%></td>
            <td><%=contact.getPhoneNumber()%></td>
            <td>
                <!-- Form for updating a contact -->
                <form action="updateContact" method="post">
                    <input type="hidden" name="id" value="<%=contact.getId()%>">
                    <input type="hidden" name="firstName" value="<%=contact.getFirstName()%>">
                    <input type="hidden" name="lastName" value="<%=contact.getLastName()%>">
                    <input type="hidden" name="email" value="<%=contact.getEmail()%>">
                    <input type="hidden" name="phoneNumber" value="<%=contact.getPhoneNumber()%>">
                    <input type="submit" value="Update">
                </form>
                <!-- Form for deleting a contact -->
                <form action="deleteContact" method="post">
                    <input type="hidden" name="id" value="<%=contact.getId()%>">
                    <input type="hidden" name="firstName" value="<%=contact.getFirstName()%>">
                    <input type="hidden" name="lastName" value="<%=contact.getLastName()%>">
                    <input type="hidden" name="email" value="<%=contact.getEmail()%>">
                    <input type="hidden" name="phoneNumber" value="<%=contact.getPhoneNumber()%>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p>No contacts available.</p>
    <% } %>
</div>

<div class="message">
    <% String mesg = (String)request.getAttribute("mesg");
       if(mesg != null) { %>
    <h4><%=mesg %></h4>
    <% } %>
</div>
</body>
</html>