<%-- JSP file that pracitises using a JSP built-in object session to record a username --%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Enter Your Username</title> 
</head>
<body>
   	<form action="" method="post" name="form1">
   		<br />Username:
   		<input type="text" name="textUsername"> 
       	<input type="submit" name="buttonSubmit" value="OK">
  	</form>
  	<%
  	String username = request.getParameter("textUsername");
  	
  	if (username == null)
  		username = "";
  	else if (username.length() == 0)
  	{
  	%>
  		<script>alert("Please enter a username!");</script>
  	<%
  	}
  	else
  	{
  		session.setAttribute("username", username);
  		response.sendRedirect("book.jsp");
  	} // end nested if...else
  	%> 
</body>
</html>