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
	 	/* long idUser = (long)request.getAttribute("idUser"); 
	 	String userName = (String)request.getAttribute("userName");
		String password = (String)request.getAttribute("password");
		double novcanik = (double)request.getAttribute("novcanik");*/
		User user = (User)request.getAttribute("user");
		
	%>
	
	<p>Unesi nove podatke za usera!!!</p><br><br>
		<form action="Edit2" method="get">
							<input type="hidden" value="<%= user.getIdUser()%>" name="idUser"/>
				USER NAME: <input type="text" placeholder= " <%= user.getUserName() %>" name = "userName"/><br>
				PASSWORD : <input type="text" placeholder= " <%= user.getPassword() %>" name = "password"/><br>
				NOVCANIK : <input type="text" placeholder= " <%= user.getNovcanik() %>" name = "novcanik"/><br><br>
							   <input type="submit" value="IZMENI"/>		
		</form>
	
	
</body>
</html>