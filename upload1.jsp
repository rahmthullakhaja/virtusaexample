<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.zip.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String tit=request.getParameter("tit");
String fname=request.getParameter("fname");
String scat=request.getParameter("fn");
String uname=(String)session.getAttribute("uname");
ResultSet rs = null;
try 
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ideas", "root", "root");
	
	
			FileInputStream fis=null;
			System.out.println("scat: "+scat);
			int i = scat.lastIndexOf('\\');
			String buffer = scat.substring(i+1);
			File f1 = new File("C:/Users/supraja/Desktop/"+buffer);
			fis = new FileInputStream(f1);
			PreparedStatement ps=con.prepareStatement("insert into upload(fname,tit,filee,buffer,uname) values(?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, tit);
			
			ps.setBinaryStream(3, (InputStream) fis, (int) (f1.length()));
			ps.setString(4, buffer);
			ps.setString(5, uname);
			ps.executeUpdate();
			response.sendRedirect("upload.jsp?msg=Uploaded Successfully");
		
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>