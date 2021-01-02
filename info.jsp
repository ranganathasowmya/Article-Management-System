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
<title>LogCat</title>
</head>
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
<div class="topnav">
<img src="logo.dbms.png" style="width:100px;height:50px">
 </div>
 <h3>Number of Users and their list</h3>
 <div class="active">
  <table border="1">
<%
try{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	//if(search!=null)
	{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();
        %>       
         <%
        
         rs=st.executeQuery("select username,ts from login_logout");
        %>
          
      <% 
        while(rs.next())
        { %> 
        
        
        <tr><th>
        	<% out.println(rs.getString(1)+"\n");%> </th><th><% out.println(rs.getString(2)+"\n");%>
      </th> 
      
      	<%
        	
        }
	}
	
	
}
catch (SQLException ex) {
    // handle the error
	System.out.println("SQLException: " + ex.getMessage());
   System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}

finally{
	  
}

%>


</table></div>
</body>
</html>