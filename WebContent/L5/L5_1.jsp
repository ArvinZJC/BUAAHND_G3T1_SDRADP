<%-- JSP file that pracitises using JSP built-in objects out, request, and response --%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Practise Using JSP Built-in Objects "out", "request", and "response"</title>
</head>
<body>
	<%-- the following 2 statements show 2 ways to import packages --%>
	<%@ page import="java.io.*, java.util.*" %>
	<%@ page import="javax.servlet.http.Cookie" %>
	<b>Some Request Object Info:</b>
	<%-- JSP built-in objects out and request --%>
	<%
	out.println("<br />getMethod:");
	out.println(request.getMethod());
	out.println("<br />getParameter:");
	out.println(request.getParameter("name"));
	out.println("<br />getAttributeNames:");
	
	Enumeration<String> e = request.getAttributeNames();
	
	while (e.hasMoreElements())
		out.println(e.nextElement());
	
	out.println("<br />getCharacterEncoding:");
	out.println(request.getCharacterEncoding());
	out.println("<br />getContentType:");
	out.println(request.getContentType());
	out.println("<br />getProtocol:");
	out.println(request.getProtocol());
	out.println("<br />getRemoteAddr:");
	out.println(request.getRemoteAddr());
	out.println("<br />getRemoteHost:");
	out.println(request.getRemoteHost());
	out.println("<br />getRemoteUser:");
	out.println(request.getRemoteUser());
	out.println("<br />getServerName:");
	out.println(request.getServerName());
	out.println("<br />getServePort:");
	out.println(request.getServerPort());	
	%>
	<hr />
	<%-- JSP built-in objects out and response --%>
	<%
	String username = "ArvinZJC", timeOutput;
	Cookie cookie = new Cookie("ArvinZJC_access_time", "Fri-Oct-26-16:54:27-CST-2018"), cookieResponse = null;
	Date datetime = new Date();
	
	response.addCookie(cookie);
	
	if (cookie.getName().equals(username + "_access_time"))
		cookieResponse = cookie;
	
	timeOutput = datetime.toString().replaceAll(" ", "-");
	out.println("Current time: " + timeOutput + "<br />");
	
	if (cookieResponse != null)
	{
		out.println("Last access time: " + cookieResponse.getValue());
		cookieResponse.setValue(timeOutput); // update last access time to print the correct value next time
	}
	else
		cookieResponse = new Cookie(username + "_access_time", datetime.toString());
	
	response.addCookie(cookieResponse);
	response.setContentType("text/html");
	response.flushBuffer();
	%>
</body>
</html>