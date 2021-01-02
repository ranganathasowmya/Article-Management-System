<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="NewFile.css">
<link rel="stylesheet" href="NewFile1.css">
<style type="text/css"></style>
<title>update
</title>
</head>


<body>
<form method="post">

<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
  <!--  <input type="text" placeholder="Search article here" name="search1">-->
 </div>
 <style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
 <div class="container">

  <table > 
			<tr class="row">
				<td  class="col-25">User Name</td>
				<td><input type="text" name="username"  placeholder="enter user name..."/></td>
			</tr>
				
	<tr class="row">
	<td  class="col-25">Enter New Password</td>
	<td><input type="password" name="password1"  id="myInput" size="35" placeholder="enter password...."><br><br>
<input type="checkbox" onclick="myFunction()">Show Password</td>			
			</tr>
			
		</table>	
<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
	
		<input type="submit" value="SUBMIT" >

<br><br>
		
		<br><br>
		<br>	
		<br><br>
		<br>	
		<br><br>
		<br>	
		
				
<%
   String  user= request.getParameter("username");
String password=request.getParameter("password1");
//out.print(password);
%>
 
<%
try{
	
	//out.print(user+" "+password);
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();  
      // rs=st.executeQuery("select username from register");
       
        	// out.print(rs.getString(1));
        	{
        		        if(password!=null && user!=null){
         int i=st.executeUpdate("update register set password='"+password+"' where username='"+user+"'");
         out.println("updated");
         response.sendRedirect("login.jsp");
         }
        		        }
	
	%>
	
	
<% }
catch (SQLException ex) {
    // handle the error
	System.out.println("SQLException: " + ex.getMessage());
   System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}

finally{
	  
}

%>


	</form>
	
</body>
</html>