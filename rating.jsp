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
<link rel="stylesheet" href="rating.css">

<title>rating</title>
</head>

<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
<div class="topnav">
<img src="logo.dbms.png" style="width:100px;height:50px">
</div>

    <table > 

			<tr>
				<td>Article Name</td>
				<td><input type="text" name="article_name"  size="35" maxlength="20"/></td>
			</tr>
				<tr align="left">
				<td>article writer name</td>
				<td><input type="text" name="articlecreator"  size="35" maxlength="20"/></td>
			</tr>
			<tr>
				<td>Comments</td>
				<td><input type="text" name="comment"  size="35" maxlength="20"/></td>
			</tr>
		</table>	
		

 
		
		<h1>Rating for above article</h1>
  <div class="topnav">
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>
<input type="submit" value="SUBMIT" >        
			
			</div>
		<br>
<form action="post">
<%
//String a2=request.getParameter("rating"); 
		
		try
		{
			Connection con=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
			Statement st= con.createStatement();
		
			String articlename=request.getParameter("article_name");
    		String articlecreator=request.getParameter("articlecreator");
String comment=request.getParameter("comment");
String rating=request.getParameter("rating");
		String username1=session.getAttribute("username").toString();
//String username1="sowmya";
out.print(articlename);
out.print(articlecreator);
out.print(comment);
out.print(rating);
out.print(username1);

			
		//if(comment!=null && rating!=null)
{        	
	ResultSet rs=st.executeQuery("insert into user_rating (article_name,rating,username,user_comment,article_creator) values('"+articlename+"','"+rating+"','"+username1+"','"+comment+"','"+articlecreator+"');");
	out.print("thank u");
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
</form>
</body>
</html>