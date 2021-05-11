<%String msg=request.getParameter("msg"); %>
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
	<script language="javascript" type="text/javascript">
	function clearText(field) {

		if (field.defaultValue == field.value)
			field.value = '';
		else if (field.value == '')
			field.value = field.defaultValue;

	}
</script>
<script>
function val()
{
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var mobno = /^\d{10}$/;
	var letters = /^[A-Za-z]+$/;
		
	var ename = document.register.name.value;
	
	if(ename == "")
	{ 	alert("Please enter name");
		document.register.name.focus();
		flag=0;	
		return false;
	}else  if(!ename.match(letters))
	{
		document.register.name.focus();
		alert("Please enter only alphabets");
		flag=0;
		return false;
	}else
	{
		flag=1;
	}
	
	var uname = document.register.uname.value;
	
	if(uname == "")
	{ 	alert("Please enter user name");
		document.register.uname.focus();
		flag=0;	
		return false;
	}else
	{
		flag=1;
	}
	
	var pwd = document.register.pwd.value;
	if(pwd == "")
	{ 	alert("Please enter password");
		document.register.pwd.focus();
		flag=0;	
		return false;
	}else
	{
		flag=1;
	}
	
	var age = document.register.age.value;
	if(age == "")
	{ 	alert("Please enter age");
		document.register.age.focus();
		flag=0;	
		return false;
	}else
	{
		flag=1;
	}
	
	var mob = document.register.mob.value;
	if(mob=="")
	{
		document.register.mob.focus();
		alert("Please enter mobile number");
		flag=0;
		return false;
	}else if(!(document.register.mob.value.match(mobno)))
	{
		document.register.mob.focus();
		alert("Please enter a valid mobile number");
		flag=0; 
		return false;
	}else
	{
		flag=1;
	}
	
	var mail = document.register.email.value;
	if(mail=="")
	{
		document.register.email.focus();
		alert("Please enter Email");
		flag=0;
		return false;
	}else  if (!(document.register.email.value.match(mailformat))) 
	{
		alert('Please provide a valid email address');
		document.register.email.focus();
		flag=0;
		return false;
	}else
	{
		flag=1;
	}
	
	if(flag==0)
	{
		return false;
	}else
	{
		return true;
	}
}
</script>
</head>
<body>

<%@include file="header.jsp" %>
<div>

	<h1>Registration Page</h1>
			 <br><br><center> <%if(msg!=null){ %>
      <%=msg %><br>
      <%} %></center>
    
         <form action="reg1.jsp" method="post" name="register" onsubmit="return val()">
							<table style="padding-left:312px"cellpadding="05px">
         						<tr> 
          							<td>Name</td>
          							<td><input type="text" name="name"></input></td>
          						</tr>
          						<tr>
          							<td>User Name &nbsp;</td>
          							<td><input type="text" name="uname"></input></td>
          						</tr>
          						<tr>
          							<td>Password</td>
          							<td><input type="password" name="pwd"></input></td>
          						</tr>
          						<tr>
          							<td>Age</td>
          							<td><input type="text" name="age"></input></td>
          						</tr>
          						<tr>
          							<td>Mobile</td>
          							<td><input type="text" name="mob" maxlength="10"></input></td>
          						</tr>
          						<tr>
          							<td>Email</td>
          							<td><input type="text" name="email"></input></td>
         						</tr>
          						<tr>
									<td><input type="reset" value="Reset"></input></td>
									<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" value="Register"></input></td>
								</tr>
         					 </table>  
          				</form> 
      </div>
    </div>
   
  </div>
</body>
</html>

	</body>
</html>
