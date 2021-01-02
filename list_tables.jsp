<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="NewFile.css">
<style type="text/css"></style>
<title>Insert title here</title>
</head>
<body>
<div class="header">
  <h1 align="right">Quest World</h1>
</div>
<form method="post" action="action.jsp">
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
 <input type="text" placeholder="Search article here" name="search">
 </div>
 <%
try
{
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
	Statement st= con.createStatement(); %> <% 
	//int i=st.executeUpdate("select article_name from list_article");
//	int j=st.executeUpdate("insert into publication(pub_name,pub_year,pub_newspaper,aticle_name)values('"+pub_name+"','"+pub_year+"','"+pub_newspaper+"','"+article_name+"')");
 ResultSet rs = st.executeQuery("show tables");
 %>
 <h1>List of Tables</h1>
 <table border="1">
<tr> <% 
 while(rs.next())
 {
	 %><td><h3> <% out.println(rs.getString(1));%> </h3> </td>
	 <% 
 }

      
         	
           	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
finally{
	
}
%>
</table>
</form>
</body>
</html>