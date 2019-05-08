<%-- JSP file that pracitises using a JSP built-in object session to record the total price of books selected --%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Total Price</title>
</head>
<body>
	<br />
  	<%
  	String username = (String)session.getAttribute("username");
    
    if (username == null)
    	username = "";
    else
    {
    	double totalPrice = 0;
    	String bill = new String((StringBuilder)session.getAttribute("bill"));
        String[] prices = bill.split("[^0-9.]");
        
        for (String eachPrice : prices)
        {
        	try
        	{
        		totalPrice += Double.parseDouble(eachPrice);
            }
            catch(NumberFormatException e) {} // end try...catch
        } // end for
    %>
    	<br />Username: <%= username %><br />
    	<br />Bill:
    	<br /><%= bill %>
    	<br />Total price: ￥<%= String.format("%.2f", totalPrice) %>
    <%
    } // end if...else
    %>
</body>
</html>