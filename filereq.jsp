 <%@ page import="java.sql.*"%>
 <%
System.out.println("file req");
String fid = request.getParameter("fid");
System.out.println("file req fid:"+fid);
int cnt1=0;
String s="Not Accepted";
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:ideas", "root", "root");
	PreparedStatement ps2 = con.prepareStatement("select count(*) from freq where fid=?");
	ps2.setString(1, fid);
	ResultSet rs1 = ps2.executeQuery();
	while(rs1.next())
	{
		cnt1=rs1.getInt(1);
	}
	if(cnt1==0)
	{
	PreparedStatement ps = con.prepareStatement("insert into freq values(?,?,?)");
	ps.setString(1, fid);
	ps.setString(2, s);
	ps.setString(3, "-11");
	
	int r=ps.executeUpdate();
	response.sendRedirect("search1.jsp?msg=Your request has been sent to pracitioner. Wait for acceptance");
	}
	else
	{
		response.sendRedirect("search1.jsp?msg=Request already sent. Please check status for key");
	}
			
}
catch(Exception e)
{
	e.printStackTrace();
}

%>