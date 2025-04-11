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
    width: 30%;
    margin: 50px auto;
    border: 1px solid;
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

  h4 {
    margin-bottom: 10px;
    margin-left: 100px;
  }

  

  input[type="submit"] {
    width: 30%;
    padding: 10px;
    background-color: #f44336;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-left: 190px;
  }
 h4{
    font-size: 30px;
    color: white;
    margin-left: 43%;

}
  input[type="submit"]:hover {
    background-color: #d32f2f;
  }
  .input{
  height: 20px;
  width: 50%;
  font-size: 17px;
  }
  .id{
  font-size: 17px;
  font-weight: bold;
  margin-left: 50px;}
  
</style>

</head>
<body>
   <div class="container" align="center">
    <div class="header">
        <h2>Delete Contact</h2>
    </div>
    <div class="form-container" align="center">
       
        <form action="deleteContact" method="post">
           <label class="id">Enter the Id:</label> <input type="number" class="input" name="id" value="<%=request.getParameter("id")%>">
            <h4>Are you sure you want to delete this contact?</h4>
            <input type="submit" value="Delete">
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