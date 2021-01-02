<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>my account</title>
<link rel="stylesheet" href="NewFile.css">
<style type="text/css"></style>
</head>
<body>

<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
 <div class="topnav">
 <a class="active" href="comment.jsp">Comments</a>
 <img src="logo.dbms.png" style="width:100px;height:50px">
 </div>

<table border="1">
<% String username=session.getAttribute("username").toString();
//String username="sahana";
%><h2><%out.println("welcome "+username);  %></h2><% 
try
{
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
	Statement st= con.createStatement();
	//int i=st.executeUpdate("select article_name from list_article");
//	int j=st.executeUpdate("insert into publication(pub_name,pub_year,pub_newspaper,aticle_name)values('"+pub_name+"','"+pub_year+"','"+pub_newspaper+"','"+article_name+"')");
 /* ResultSet rs = st.executeQuery("SELECT * from register where username='"+username+"'");


           while(rs.next()) {%>
           <tr>
           <th>  first name:</th><td><% out.print(rs.getString(1));%></td>
</tr>        	
<tr>
           <th>Article</th><td><% out.println(rs.getString(2));%>
</td></tr> <tr>
           <th>User Name:</th><td>
<%out.println(rs.getString(3)); %></td></tr><tr>
           <th>Password:</th><td>
<% out.println(rs.getString(4));%></td></tr><tr>
           <th>Address:</th><td>
<% out.println(rs.getString(5));%></td></tr><tr>
           <th>Contact:</th><td>
<% out.println(rs.getString(6));%></td></tr>
          <%  } */
         ResultSet rs1=st.executeQuery("select  topic,article_name ,article_info from insert_article where username='"+username+"'");
         while(rs1.next())
         {  
         %>
           <tr> <td><h3>Topic:</h3><% out.print(rs1.getString(1));%></td>
        <td>   <h3>Article Name:</h3><% out.println(rs1.getString(2));%></td>
  <td>  <h3>Article Information:</h3><% out.print(rs1.getString(3));%></td></tr>
    
<% 
}
           
}
catch (SQLException ex) {
    // handle the error
	System.out.println("SQLException: " + ex.getMessage());
   System.out.println("SQLState: " + ex.getSQLState());
    System.out.println("VendorError: " + ex.getErrorCode());
}
finally {
	
	
}

%>

</table>
</body>
</html>