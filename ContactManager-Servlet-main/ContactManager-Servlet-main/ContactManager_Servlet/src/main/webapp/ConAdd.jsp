<%@page import="com.jspider.ContactManager_Servlet.entity.Contact"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: black;
}

.container {
    width: 25%;
    margin: 100px auto;
    padding: 20px;
    background-color:white;
    border-radius: 8px;
    box-shadow: 0 0 10px black;
}

.header {
    text-align: center;
    margin-bottom: 20px;
    font-size: 25px
}

.form-container {
    text-align: left;
}

label {
    font-weight: bold;
    font-family: sans-serif;
    font-size: 20px;
}

input[type="text"],
input[type="email"],
input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid transparent;
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 20px;
    border-bottom:2px solid;
    background-color: white;
}

input[type="submit"] {
    width: 50%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    margin: 10px 25%;
}
h4{
font-size: 30px;
color: white;
margin-left: 43%;

}


input[type="submit"]:hover {
    background-color:purple;
}


.submit{
   display: flex;
}
button{
  height: 60px;
  width: 120px;
  background-color: white;
  border-radius: 20px;
  box-shadow: 0px 0px 10px white;
  border: none;
 
}
button:hover{
background-color: green;
}
button a{
  color: black;
  font-size: 20px;
  text-decoration: none;
  font-weight: bold;
}

</style>
<body>
 <div class="container" align="center">
          <div class="header">
            <h2>Contact</h2>
          </div>
          <div class="form-container" align="center">
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
             <div class="submit">
              <input type="submit" name="action" value="Save"> 
               </div> 
             </form>
          </div>
         
   </div>
   <div>
     <% String mesg = (String)request.getAttribute("mesg");
     if(mesg != null){
    	 %>
    	 <h4><%=mesg %></h4>
    	 <%
    	 }
     %>
   </div>
   <div>
     <button><a href="http://localhost:8080/ContactManager_Servlet/ConFind.jsp">View All Contacts</a></button>
   </div>

</body>
</html>