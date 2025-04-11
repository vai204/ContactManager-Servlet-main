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
    background-color: black;
    margin: 0;
    padding: 0;
  }

  .container {
    width: 20%;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  .header {
    text-align: center;
    margin-bottom: 30px;
  }

  .form-container {
    text-align: left;
  }

  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    font-size: 19px;
  }

  input[type="text"],
  input[type="email"],
  input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid black;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 20px;
  }

  input[type="submit"] {
    width: 50%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-left: 25%;
  }

h4{
font-size: 30px;
color: white;
margin-left: 43%;

}
  input[type="submit"]:hover {
    background-color: #45a049;
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
      <h2>Update Contact</h2>
    </div>
    <div class="form-container">
        <form action="updateContact" method="post">
         <label>Id:</label>
           <input type="number" name="id" >
            <label>First Name:</label>
            <input type="text" name="FirstName"><br>
            <label>Last Name:</label>
            <input type="text" name="LastName" ><br>
            <label>Email:</label>
            <input type="email" name="Email" ><br>
            <label>Phone Number:</label>
            <input type="number" name="PhoneNumber"><br>
            <input type="submit" value="Update">
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
</body>
</html>