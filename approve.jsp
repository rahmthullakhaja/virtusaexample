<%@page import="java.sql.*"%>
 <% String uname = request.getParameter("uname");
 System.out.println("uname: "+uname);
			try
			{
				
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ideas", "root", "root");
			PreparedStatement ps = con.prepareStatement("update reg set status=? where uname=?");
			ps.setString(1, "accept");
			ps.setString(2, uname);
			
			int n=ps.executeUpdate();
			System.out.println("n:"+n);
			response.sendRedirect("vpd.jsp?msg=approve sucessfully done");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
%>