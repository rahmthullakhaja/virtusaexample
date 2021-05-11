<%String fname=request.getParameter("fname"); 
  String msg=request.getParameter("msg");
%>
<%@page import="java.sql.*"%>
<% try
	{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ideas","root","root");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from upload");
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
	<br><br><center> <%if(msg!=null){ %>
      <%=msg %><br>
      <%} %></center>
	<BR><BR><BR><center>
     <table  border="1" width="600px;" >
			 
			 <th><font color="red">File Name</font></th>
			  <th><font color="red">Title</font></th>
			   
			   <th><font color="red">View Files</font></th>
			 
			
				    
			 <%while(rs.next()){%>
			 <tr>

			
			 <td><font color="green"><%=rs.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
			 <td><font color="green"><%=rs.getString(2)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
		    
			<td><a href="search2.jsp?fid=<%=rs.getString(6)%>"><font color="green">View Files</font></td>
			
			 </tr>
			 <%}
	}
			catch(Exception e)
			{
			out.println(e);
			}
			 %>
			 </table>
	<center>
		  


</body>
</html>