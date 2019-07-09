<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit user dugme koje podesava podatke nove</title>
</head>
<body>
	
	<a href = "administrator.jsp">back to admin page</a><br><br>
	
	<% 
		String userName = (String)request.getAttribute("userName");
		String password = (String)request.getAttribute("password");
		double novcanik = (double)request.getAttribute("novcanik");
	%>
	
	<p>Unesi nove podatke za usera!!!</p><br><br>
		<form action="../EditUserDugmeServlet2" method="get">
				USER NAME: <input type="text" placeholder="<%= userName %> "  name = "userName"><br>
				PASSWORD : <input type="text" placeholder= " <%= password %>" name = "password"><br>
				NOVCANIK : <input type="text" placeholder= " <%= novcanik %>" name = "novcanik"><br><br>
							   <input type="submit" value="IZMENI">		
		</form>	
	
</body>
</html>