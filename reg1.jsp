<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
String age = request.getParameter("age");
String mob = request.getParameter("mob");
String email = request.getParameter("email");
int cnt=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cog","cog");
	String sql=null;
	PreparedStatement ps1=con.prepareStatement("select count(*) from reg where uname=?");
	ps1.setString(1, uname);
	ResultSet rs = ps1.executeQuery();
	while(rs.next())
	{
		cnt=rs.getInt(1);
	}
	if(cnt==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into reg(name,uname,pwd,age,mob,email) values(?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, uname);
		ps.setString(3, pwd);
		ps.setString(4, age);
		ps.setString(5, mob);
		ps.setString(6, email);
		ps.executeUpdate();
		response.sendRedirect("reg.jsp?msg=Registered Successfully");
	}
	else
	{
		response.sendRedirect("reg.jsp?msg=Username already exists try with another one.");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
