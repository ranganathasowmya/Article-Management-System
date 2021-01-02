<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*,java.util.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="NewFile.css">
<link rel="stylesheet" href="NewFile1.css">
<link rel="stylesheet" href="rating.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<body>
<div class="header">
  
  <h1 align="right">Quest World</h1>
</div>
 <div class="topnav">
 <img src="logo.dbms.png" style="width:100px;height:50px">
  <a class="active" href="insert_topic.jsp">Add Article</a>
 </div>
<form method="post" action="serach5.jsp">




<% 
String table_name=request.getParameter("table_name");
String username1=session.getAttribute("username").toString();
//String table_name=request.getParameter("firstname");

%>
 

<%
try{
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	//out.print(table_name+" "+rating+" "+comment+" "+username1);
	if(table_name!=null)
	{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		  con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/article_management","root","root");  
         st= con.createStatement();
         rs=st.executeQuery("select username,topic,article_name,article_info  from  insert_article where topic like '"+table_name+"%'");
        while(rs.next())
        {
        //	out.print(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" ");
        %>
        	
        <table border="1" >
        	<tr>
        	<th>Article Writer:</th>
        	<td><h4><% 
        	out.print(rs.getString(1)+" \n");
        	%></h4></td>
        	
        	
        	
        	<tr>
        	<th>Article name:</th><td><h4>
        	<% 
        	out.print(rs.getString(3)+" \n");
        	
        	%></h4></td>
        	<tr>
        	<th>Article information:</th><td>
        	
        	<% out.print(rs.getString(4)+" \n"); %>
        	
        	
        	</td>
         </tr>	</tr></table>
<%  

        	        }
    } %>
	<div class="container">
	  
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
	        <label for="country">Rating</label>
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
	<%
	String article_name=request.getParameter("firstname");
	String article_creator=request.getParameter("lastname");
	String rating=request.getParameter("country");
	//float rat=Float.parseFloat(rating);
	String comment=request.getParameter("subject");
//	out.print(article_name+" "+rating+" "+comment+" "+username1+" "+article_creator);
	
	%>
	
<% 
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
</body>
</html>

        	        
        	     
        	        
        		
    