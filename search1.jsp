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
<title>searching
</title>
</head>
<body>
<form method="post">
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
  
 </div>
<%
//    String array = request.getParameterValues("username");
//String table_name=session.getAttribute("table_name").toString();
String attribute=request.getParameter("search");
String username1=session.getAttribute("username").toString();
%>
<h3>Most Rated Article</h3>
<table border="1">
<%
try{
	if(attribute!=null)
	{
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();
         rs=st.executeQuery("select  username,topic,article_name ,article_info from  insert_article where article_name like '"+attribute+"%'");
        while(rs.next())
        {
        	 %>
        	 <tr><th>Article writer:<td><h4><%
        	out.println(rs.getString(1)+" \n");
        	 %>
        	 </td>
	</th></tr>
	<tr><th>Topic:
	<td>
        <h4>	 <%
        	 out.print(rs.getString(2));
 %></h4>
 <tr><th> Article Name: <td><h4><%
        	out.println(rs.getString(3)+" \n");
        	 %>
        	</h4></td> 
	</th></tr>
	<tr><th>Article information:
	<td>
        	 <%
        	 out.print(rs.getString(4));
 %>
 </tr>
	</td>
 <%        }
        //int i=st.executeUpdate("select username from insert_article where topic='"+table_name+"' and article_name='"+attribute+"'");
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