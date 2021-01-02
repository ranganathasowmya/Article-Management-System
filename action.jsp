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
<title>tables
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
//    String array = request.getParameterValues("username");
String search1=request.getParameter("search");
%>
<form method="post">
<table border="1">
<%
try{
	if(search1!=null)
	{
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();
         rs=st.executeQuery("select * from "+search1+"");
        while(rs.next())
        {
        	 %>
        	 <tr><th><%
        	out.println(rs.getString(1)+": \n");
        	 %>
	</th>        	 

	
	<td>
        	 <%
        	 out.print(rs.getString(2));
 %>
 </td>
 
	
	
	 <td>
        	 <%
        	out.print(rs.getString(3));
 %>
 </td>
 
	
	
	<td>
        	 <%
        	 out.print(rs.getString(4));
 %>
 </td>

	
	
	
 </tr>
	
 <%        }
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


<% String s1=search1; %>

	<% session.setAttribute("s1", s1); %>
	</form>
	
</body>
</html>