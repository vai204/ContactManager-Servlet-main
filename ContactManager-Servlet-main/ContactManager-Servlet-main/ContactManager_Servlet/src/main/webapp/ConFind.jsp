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
        background-color: black;
    }

    .container {
        width: 100%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 70%;
        border : 3px solid;
        margin-top: 50px;
        background-color: white;
       
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid ;
         border : 1px solid;
    }

    th {
        
        font-size: 20px;
    }
    

    tr:hover {
        background-color: grey;
        
    }
    button a{
    color:black;
    text-decoration: none;
    }
    

    button {
        height:30px;
        width: 60px;
        padding: 5px 10px;
        background-color: skyblue;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
       margin-right: 10px;
    }

    button:hover {
        background-color: green;
        
    }
    button a:hover{
     color: white;
    }
     
</style>
</head>
<body>
    <%
    List<Contact> contacts = ContactJDBC.findAllContact();
    if(contacts != null && contacts.size()>0){	
    %>
    <div align="center">
        <table border="1px solid">
          <tr>
                <th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>Action</th>
          </tr>
           <% for (Contact contact : contacts) { %>
        	
        	 <tr>
				<td><%=contact.getId()%></td>
				<td><%=contact.getFirstName()%></td>
				<td><%=contact.getLastName()%></td>
				<td><%=contact.getEmail()%></td>
				<td><%=contact.getPhoneNumber()%></td>
				  <td>
                    <button align ="center"><a href="http://localhost:8080/ContactManager_Servlet/ConUpdate.jsp">Update</a> </button>
                    <button align ="center"><a href="http://localhost:8080/ContactManager_Servlet/ConDelete.jsp">Delete</a> </button>
                </td> 
			</tr>
        	<%
          }
          %>
         
        </table>
    </div>
    <%
    } else{%>
    <h1>Contact not available</h1>
    <%} %>
</body>
</html>