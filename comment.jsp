<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="rating.css">
<link rel="stylesheet" href="NewFile.css">
<style type="text/css"></style>
<title>comment
</title>
</head>
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
 
 </div>
<%
String username=session.getAttribute("username").toString();
%>
<form method="post">
<table border="1">
<%
try{
	
	{
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();
         rs=st.executeQuery("select * from user_rating where article_creator='"+username+"'");
        
         {
        	 while(rs.next())
         
        {
        	 %>
        	 <table border="1" >
        	<tr>
        	<th>Article Name:</th>
        	<td><h4><% 
        	out.print(rs.getString(1)+" \n");
        	%></h4></td>
        	<tr>
        	<th>Rating:</th>
        	<td><h4><% 
        	out.print(rs.getString(2)+" \n");
        	%></h4></td>
        	
        	
        	
        	<tr>
        	<th>User name:</th><td><h4>
        	<% 
        	out.print(rs.getString(3)+" \n");
        	
        	%></h4></td>
        	<tr>
        	<th>Comment:</th><td>
        	
        	<% out.print(rs.getString(4)+" \n"); %>
 <%        }}
         
	}
	
	%>
	</tr>
	</td>
	</table>
	
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