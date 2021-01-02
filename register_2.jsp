<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="NewFile.css">
<link rel="stylesheet" href="NewFile1.css">
<style type="text/css"></style>
<title>welcome user</title>

</head>
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
<form method="post" action="search1.jsp">
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
  <a class="active" href="#home">Home</a>
  <a href="article.jsp">List of Article</a>
  
  <a href="insert_article.jsp">Insert article</a>
  <a href="user_account.jsp">My Account</a>
  <a href="logout.jsp">Logout</a>
  <input type="text" placeholder="Search article here" name="search">
</div> 
<!-- Navigation -->
<section>
  <img class="mySlides" src="image1.dbmc.png"
  style="width:100%;height:300px" >
  <img class="mySlides" src="d1.png"
  style="width:100%;height:300px">
  <img class="mySlides" src="d3.png"
  style="width:100%;height:300px">
  <img class="mySlides" src="d4.png"
  style="width:100%;height:300px">
 
</section>


<!-- Band Description -->
<section class="w3-container w3-center w3-content" style="max-width:600px">
  <h2 class="w3-wide">Quest World</h2>
  <p class="w3-opacity"><i>Description</i></p>
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
 <p>The article management system is a system where, the user can access articles effortlessly. This system is created to provide the user a one stop platform, wherein he can acquire all the knowledge he wants.
 The platform will have a diverse subject of topics which will enable users with different interests to be able to use the platform. A user does not have to have any technical knowledge for them to access the article through our system. This, is enabled since the system consists of a simple user interface. 
The articles can be searched in various ways choosing, what's  most convenient to the user .They can be searched based on the topics they are segregated into or,  by the date they were published on. They can also be found  by the name of the article itself. This platform  will also provide certain other features to the user such as, suggesting them articles depending on the their interest .It will also show them certain popular articles based on them being read the most.
 The front end user interface is created using java. This will make the system simple and understandable for the user. A lot of information for the function use of the system is stored in the database. The database will contain all the information about the user authentication to start with .It will then mainly contain articles with their details such as the name of the topic to which it belongs to and the date on which it was published. It will also keep track of the article read by an user and will suggest the articles of similar interest. It will also enable the system to portray the most read articles by keeping a count on how many user have read an article.

</p>


 <h2>List of most rated article</h2>
 <table border="1">
<%
try{
	
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
	Statement st= con.createStatement();
	//int i=st.executeUpdate("select article_name from list_article");
//	int j=st.executeUpdate("insert into publication(pub_name,pub_year,pub_newspaper,aticle_name)values('"+pub_name+"','"+pub_year+"','"+pub_newspaper+"','"+article_name+"')");
	  ResultSet rs = st.executeQuery("with cte as (select article_name,avg(rating) as avg_stars from user_rating group by article_name) select * from cte where avg_stars=(select max(avg_stars) from cte);");
      while(rs.next()) {
    	  %>
    	  <tr>
    	  <td>
    	  <% 
   	   out.print(rs.getString(1));
     // System.out.println();
     %></td></tr><% 
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