<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
if(uname.equals("visitor")&&pwd.equals("visitor"))
{
	response.sendRedirect("sitehome.jsp?msg=sucess");
}
else
{
	response.sendRedirect("site.jsp?msg=Please enter valid credentials");	
}
%>