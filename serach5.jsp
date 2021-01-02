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
<form method="post">
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
 </div>
 <!-- <div class="container">
	  
	    <div class="row">
	      <div class="col-25">
	        <label for="fname">Article Name</label>
	      </div>
	      <div class="col-75">
	        <input type="text" id="fname" name="firstname" placeholder="Article name..">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="fname">Article Writer name</label>
	      </div>
	      <div class="col-75">
	        <input type="text" id="fname" name="lastname" placeholder="Article  writer name..">
	      </div>
	    </div>
	   
	    <div class="row">
	      <div class="col-25">
	        <label for="country">Country</label>
	      </div>
	      <div class="col-75">
	        <select id="country" name="country">
	          <option value="5">5</option>
	          <option value="4.5">4.5</option>
	          <option value="4">4</option>
	          <option value="3.5">3.5</option>
	          <option value="3">3</option>
	          <option value="2.5">2.5</option>
	          <option value="2">2</option>
	          <option value="1.5">1.5</option>
	          <option value="1">1</option>
	            <option value="0.5">0.5</option>
	        </select>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="subject">Comment</label>
	      </div>
	      <div class="col-75">
	        <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
	      </div>
	    </div>
	    <div class="row">
	      <input type="submit" value="Submit">
	    </div>
	  </form>
	</div>
  -->
 <%
try
{
	String username1=session.getAttribute("username").toString();
	String search=request.getParameter("search");
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
	Statement st= con.createStatement();
//	int i=st.executeUpdate("select * from '"+search+"'");
//	int j=st.executeUpdate("insert into publication(pub_name,pub_year,pub_newspaper,aticle_name)values('"+pub_name+"','"+pub_year+"','"+pub_newspaper+"','"+article_name+"')");
	String article_name=request.getParameter("firstname");
	String article_creator=request.getParameter("lastname");
	String rating=request.getParameter("country");
	//float rat=Float.parseFloat(rating);
	String comment=request.getParameter("subject");
	out.print(article_name+" "+rating+" "+comment+" "+username1+" "+article_creator);
	if(comment != null)
	{        	
		int i=st.executeUpdate("insert into user_rating (article_name,rating,username,user_comment,article_creator) values('"+article_name+"','"+rating+"','"+username1+"','"+comment+"','"+article_creator+"')");
		out.print("thank u");
		response.sendRedirect("register_2.jsp");
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

</table>
</body>
</html>