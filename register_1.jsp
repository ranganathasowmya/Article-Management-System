<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
   <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4d80e4;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h1>Quest world</h1>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Register</button>

<div id="id01" class="modal">
  
  <form class="modal-content animate"  method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="logo.dbms.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="firstname"><b>First Name</b></label>
      <input type="text" placeholder="Enter firstname "name="first_name" required>

      <label for="psw"><b>Last Name</b></label>
      <input type="text" placeholder="Enter lastname" name="last_name" required>
        
         <label for="psw"><b>User Name</b></label>
      <input type="text" placeholder="Enter username" name="username" required>
        
         <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
        
         <label for="psw"><b>Address</b></label>
      <input type="text" placeholder="Enter Address" name="address" required>
        
         <label for="psw"><b>Contact</b></label>
      <input type="text" placeholder="Enter Contact number" name="contact" required>
        
      <button type="submit">Submit</button>
     
     
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
   
<%
try
{
	
Connection con=null;
//Statement stmt = null;
  //ResultSet rs = null;
  
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String address=request.getParameter("address");
String contact=request.getParameter("contact");

	Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
Statement st= con.createStatement();
int i=st.executeUpdate("insert into register(first_name,last_name,username,password,address,contact)values('"+first_name+"','"+last_name+"','"+username+"','"+password+"','"+address+"','"+contact+"') ");
//out.println("data successfully inserted");
response.sendRedirect("login.jsp");
if(first_name==null ||last_name==null ||username==null ||password==null ||address==null ||contact==null)
out.print("invalid credentials");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>



</body>
</html>
 