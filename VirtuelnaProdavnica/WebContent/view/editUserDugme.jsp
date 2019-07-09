<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit user dugme koje uzima userName</title>
</head>
<body>
	
	<a href = "administrator.jsp">back to admin page</a><br><br>
	
	<form action="../EditUserDugmeServlet">
		Unesi User name koji zelis da menjas: <input type="text" name = "userName">
			   <input type="submit" value="SUBMIT">		
	</form>	
	
</body>
</html>