<%-- JSP file that pracitises using a JSP built-in object session to record books selected --%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Select Books</title>
</head>
<body>
  	<a href="username.jsp">← Change your userame</a><br />
  	<br />Select books:
  	<p style="color:red">-- NOTICE: Please select at least 1 book before you click "OK"! --</p>
  	<form action="" method="post" name="form1">
  		<input type="checkbox" name="checkboxBook" value="Java Programming----32.50">Java Programming&nbsp;&nbsp;&nbsp;&nbsp;&yen;32.50<br />
       	<input type="checkbox" name="checkboxBook" value="Data Structures----23.00">Data Structures&nbsp;&nbsp;&nbsp;&nbsp;&yen;23.00<br />
   		<input type="checkbox" name="checkboxBook" value="Operating Systems----39.99">Operating Systems&nbsp;&nbsp;&nbsp;&nbsp;&yen;39.99<br />
       	<input type="checkbox" name="checkboxBook" value="C++ Programming----28.60">C++ Programming&nbsp;&nbsp;&nbsp;&nbsp;&yen;28.60<br />
       	<input type="submit" name="buttonSubmit" value="OK">
  	</form> 
  	<%
  	String books[] = request.getParameterValues("checkboxBook"); 
    
  	if (books != null)
  	{
  		StringBuilder bill = new StringBuilder();
  		
  		for (int count = 0; count < books.length; count++)
  			bill.append(books[count] + "<br />");
  		
        session.setAttribute("bill", bill);
        response.sendRedirect("bill.jsp");
    } // end if
  	%> 
</body>
</html>