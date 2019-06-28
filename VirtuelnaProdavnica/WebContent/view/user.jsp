<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user page</title>
</head>
<body>
	<%
		User user = (User)session.getAttribute("ovdeJeUserObjekat");
	%>
	<h1>DOBRODOSLI USER</h1>
	ZDRAVO <%=user.getUserName() %> <br>
	<p>Ovde cu ubaciti stvari koje se ticu usera</p>


	
	
</body>
</html>


