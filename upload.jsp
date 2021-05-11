<%String msg=request.getParameter("msg"); %>
<%String uname=(String)session.getAttribute("uname"); %>
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

<%@include file="header2.jsp" %>
<div id="page">

	<div id="content">
	<h2>Upload Files</h2>
				<center>
				<%if(msg!=null){ %>
				<%=msg %><br><br>
				<%} %>
				<form action="upload1.jsp">
				<table>
				
				<tr>
				<td>File Name</td>
				<td>:</td>
				<td><input type="text" name="fname" required></td>
				</tr>
				<tr>
				<td>Title</td>
				<td>:</td>
				<td><input type="text" name="tit" required></td>
				</tr>
				
				
				<tr>
				<td>Select File</td>
				<td>:</td>
				<td><input type="file" name="fn"></td>
				</tr>
				
				<td><input type="reset" value="Reset"></td>
				<td>&nbsp; &nbsp;</td>
				<td><input type="submit" value="UPLOAD"></td>
				</tr>
				</table>
				</form>
			</div>
			
		</div>
	</div>
	
	</div>
</body>
</html>