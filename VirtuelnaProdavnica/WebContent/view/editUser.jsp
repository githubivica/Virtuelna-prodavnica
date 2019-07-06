<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.LoginDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Artikal" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit User</title>
</head>
<body>

<a href = "administrator.jsp">back to admin page</a><br><br>

<%

user = loginDAO.vratiUsera(userName);
	
	%>		
		<form action="../EditUserServlet" metod="get">
			USER NAME: <input type="text" placeholder=<%= u.getUserName() %> name = "userName">
			PASSWORD : <input type="text" placeholder=<%= u.getPassword() %> name = "password">
			NOVCANIK : <input type="text" placeholder=<%= u.getNovcanik() %> name = "novcanik">
			ULOGA	 : <input type="text" placeholder=<%= u.getRola() 	  %> name = "uloga">
					   <input type="submit" value="DODAJ">		
		</form>


</body>
</html> 