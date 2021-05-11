<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.io.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
	
	
	Blob file= null;
	
	String pk=request.getParameter("id");
	System.out.println("temp pk: "+pk);
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
		Connection con=null;
	 sql = "select * from upload where fid=?";
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ideas","root","root");
		ps = con.prepareStatement(sql);
		ps.setString(1, pk);
		rs = ps.executeQuery();
		rs.next();
		file = rs.getBlob(1);
		
		if(file != null)
		{
			String fileName = "text_file.txt";
			byte[] ba = file.getBytes(1, (int)file.length());
			response.setContentType("text");
			response.setHeader("Content-Disposition","attachment; fileName=\""+fileName+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		}
		else
		{
			//response.sendRedirect("cost_recharge2.jsp");
			System.out.println("null");
		}
	}
	catch(Exception e)
	{
	
	out.println("Exception :"+e);
	}
	finally
	{
		if(con != null)
			con.close();
		if(ps != null)
			ps.close();
		if(rs != null)
			rs.close();
	}
	

//}
//else
//{//response.sendRedirect("cost_recharge2.jsp");
//}

	%>
</body>
</html>