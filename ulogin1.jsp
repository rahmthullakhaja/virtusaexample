<%@page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
int cnt=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ideas","root","root");
	PreparedStatement ps1=con.prepareStatement("select count(*) from reg where uname=? and pwd=? and status=?");
	ps1.setString(1, uname);
	ps1.setString(2, pwd);
	ps1.setString(3,"accept");
	ResultSet rs = ps1.executeQuery();
	while(rs.next())
	{
		cnt=rs.getInt(1);
	}
	if(cnt==0)
	{
		response.sendRedirect("ulogin.jsp?msg=Invalid Credentials");
	}
	else
	{
		session.setAttribute("uname", uname);
		response.sendRedirect("userhome.jsp?msg=Login successful.");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>