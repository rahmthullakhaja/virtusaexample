 <%@ page import="java.sql.*,java.text.SimpleDateFormat"%>
<%String msg = request.getParameter("msg"); %>
<%
String uname=(String)session.getAttribute("uname");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:ideas", "root", "root");
	PreparedStatement ps = con.prepareStatement("select * from freq ");
	
	ResultSet rs=ps.executeQuery();
%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
		<!-- Site design by Brandon Booth: www.lucidgreen.net, this template is licensed under 
		the Creative Commons Attribution 3.0 License: http://creativecommons.org/licenses/by/3.0/

		== You are free to:
			+ Copy, distribute and transmit this template
			+ Adapt the work
		== You must You must attribute the work in the manner specified by the author or licensor 
			(but not in any way that suggests that they endorse you or your use of the work).
		
		== Attribution ==
		Please, leave the active link to my website in the footer section of this template.

		-->
		
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<meta name="description" content="Your description goes here"/>
	<meta name="keywords" content="your,keywords,go,here"/>
	<meta name="author" content="Brandon Booth"/>
	<title>Ideas Portal</title>

	<link rel="stylesheet" type="text/css" href="default.css" title="default" media="screen,projection"/>
</head>
<body>

<%@include file="header3.jsp" %>
<div id="page">

	<div id="content">
	<%if(msg!=null){ %>
							<p><%=msg%></p>
							<%} %>
							<table border='1'>
						<tr><th>File ID</th>
						<th>Key</th>
						<th>Status</th>
						<th>Download</th>
						</tr>
						<%while(rs.next()){ %>
						<tr>
						<td><%=rs.getString(1) %></td>
						<td><%if(rs.getString(3).equalsIgnoreCase("-11")){ %>
						Not Generated
						<%}else{ %>
						<%=rs.getString(3) %>
						<%} %></td>
						<td><%=rs.getString(2) %></td>
						<td>
						<%if(rs.getString(2).equalsIgnoreCase("Accepted")){ %>
						<a href="down.jsp?key12=<%=rs.getString(3) %>&fid=<%=rs.getString(1)%>"><u>Click to Download</u></a>
						<%}else{ %>
						Wait for acceptance
						<%} %>
						</td>
						</tr>
						<%} %>
						</table>
						<%}
catch(Exception e){
	e.printStackTrace();
}
%>
		  
	  </div><!--close content-->	    

     
	  
    </div><!--close site_content-->	
   	
  </div><!--close main-->	
</body>
</html>
