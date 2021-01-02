<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="NewFile.css">
<link rel="stylesheet" href="NewFile2.css">


</head>
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>

<h3>List of Articles </h3>
<form method="post">
<div class="topnav">
<img src="logo.dbms.png" style="width:100px;height:50px">

 
</div>  
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
 

  <!--  <table > 
 
<tr class="row">
<td class="col-25">Topic</td>
<td><input type="text" name="topic" size="35" maxlength="20" placeholder="topic..."></td></tr>
			<tr class="row">
				<td  class="col-25">Article Name</td>
				<td><input type="text" name="article_name"  size="35" maxlength="20" placeholder="article name..."/></td>
			</tr>
				
	<tr class="row">
	<td  class="col-25"> Article</td>
	<td><input type="text" name="articleinfo" size="200"  placeholder="write article here..." /></td>			
			</tr>
			
			</div>
		</table>	
	
		

<br><br>
		
		<br><br>
		<br>	
		<br><br>
		<br>	
		<br><br>
		<br>	
		
			<input type="submit" value="SUBMIT" >	-->
			<div class="container">
	  
	    <div class="row">
	      <div class="col-25">
	        <label for="fname">Topic</label>
	      </div>
	      <div class="col-75">
	        <input type="text" id="fname" name="topic" placeholder="Topic name..">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="fname">Article name</label>
	      </div>
	      <div class="col-75">
	        <input type="text" id="fname" name="article_name" placeholder="Article name..">
	      </div>
	    </div>
	        <div class="row">
	      <div class="col-25">
	        <label for="subject">Article</label>
	      </div>
	      <div class="col-75">
	        <textarea id="subject" name="articleinfo" placeholder="Write something.." style="height:200px"></textarea>
	      </div>
	    </div>
	    <div class="row">
	      <input type="submit" value="Submit">
	    </div>
	 
	</div>
	    
		<%
		String article_name=request.getParameter("article_name");
		String topic=request.getParameter("topic");
		String article_info=request.getParameter("articleinfo");
		String username1=session.getAttribute("username").toString();
		//out.print(article_info+" "+article_name+" "+topic+" "+username1);
		try
		{
			Connection con=null;
			ResultSet rs=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");
			Statement st= con.createStatement();
			//int j=st.executeUpdate("create table "+topic+"(article_name varchar(40) not null primary key,article_info longtext not null)");
		
			if( article_info!=null){
				
		  
			int i=st.executeUpdate("insert into insert_article (username, topic,article_name,article_info) values('"+username1+"','"+topic+"','"+article_name+"','"+article_info+"')");
		   response.sendRedirect("register_2.jsp");
		    out.print("data successfully inserted");
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