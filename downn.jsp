  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String msg = request.getParameter("msg");
	

	String k = request.getParameter("k");
	
%>
<%
	int cnt = 0;
	try {
		Class.forName("oracle.jdbc.drver.OracleDriver"); 
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521/ideas", "root", "root");
		PreparedStatement ps = con
				.prepareStatement("select count(*) from freq where key12=? ");
		ps.setString(1, k);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			cnt = rs.getInt(1);
		}
		if (cnt == 0) {
			response.sendRedirect("down.jsp?msg=please enter valid key (Do Not Attack)");
		} else {
			System.out.println("sdl2 else");
			PreparedStatement ps2 = con.prepareStatement("select fid from freq where key12=?");
			ps2.setString(1, k);
			ResultSet rs2 = ps2.executeQuery();
			String fid=null;
			while(rs2.next())
			{
				fid=rs2.getString(1);
			}
			int f=Integer.parseInt(fid);
			
			
			PreparedStatement ps1 = con
					.prepareStatement("select * from upload where fid=?");
			ps1.setInt(1, f);
			ResultSet rs1 = ps1.executeQuery();
			String t = null;
			while (rs1.next()) {
				System.out.println("sdl2 while");
				Blob file = rs1.getBlob("file");
				byte[] b = file.getBytes(1, (int) file.length());
				t = new String(b);
				session.setAttribute("t", t);
				System.out.println("sdl2 t:" + t);
			}
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

	    <%
					if (msg != null) {
				%>
				<h3><%=msg%></h3>
				<%
					}
				%>
				<form name="form" action="temp.jsp?id=<%=f %>" method="post"
						onsubmit="return validation()">
						<textarea name="b" cols="115" rows="20"><%=t%></textarea>
						<br>
						<br> <br>
						
						<input type="submit" value="Download" name="Decrypt">
					</form>
					<%
		}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("****************");
	%>
	  </div><!--close content-->	    

     
	  
    </div><!--close site_content-->	
   	
  </div><!--close main-->	
</body>
</html>
 