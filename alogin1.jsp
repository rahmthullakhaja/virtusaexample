<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
if(uname.equals("admin")&&pwd.equals("admin"))
{
	response.sendRedirect("adminhome.jsp?msg=sucess");
}
else
{
	response.sendRedirect("alogin.jsp?msg=Please enter valid credentials");	
}
%>