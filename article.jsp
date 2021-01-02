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
<title>list of articles</title>
</head>
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>


<form method="post" action="search.jsp">
<div class="topnav">
<img src="logo.dbms.png" style="width:100px;height:50px">
 <input type="text" placeholder="Search article here" align="right" name="table_name">

 </div>
 <section>
  <img class="mySlides" src="t2.png"
  style="width:100%;height:300px" >
  <img class="mySlides" src="t3-1.png"
  style="width:100%;height:300px">
  <img class="mySlides" src="t4.png"
  style="width:100%;height:300px">
 <img class="mySlides" src="t5.png"
 style="width:100%;height:300px">
 <img class="mySlides" src="m1.png"
 style="width:100%;height:300px">


</section>


<!-- Band Description -->
<section class="w3-container w3-center w3-content" style="max-width:600px">
 
 <h3> <p class="w3-opacity"><i>List of Topics</i></p></h3>
</section>

<script>
// Automatic Slideshow - change image every 3 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}
  x[myIndex-1].style.display = "block";
  setTimeout(carousel, 3000);
}
</script>

<%
String table_name=request.getParameter("table_name");
try
{
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
	Statement st= con.createStatement();  
	//int i=st.executeUpdate("select article_name from list_article");
//	int j=st.executeUpdate("insert into publication(pub_name,pub_year,pub_newspaper,aticle_name)values('"+pub_name+"','"+pub_year+"','"+pub_newspaper+"','"+article_name+"')");
 ResultSet rs = st.executeQuery("select distinct topic from insert_article order by topic;");
 while(rs.next())
 {
	 %>
	 <h4>
	<% 
	 out.println(rs.getString(1));
	 %>
	 </h4>
	 
	 <% 
 }
 %>
 <% 
  
 %>
 <% 

	 session.setAttribute("table_name", table_name); 
 %>
     	
    <%       	
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
finally{
	
}
%>

</body>
</html>