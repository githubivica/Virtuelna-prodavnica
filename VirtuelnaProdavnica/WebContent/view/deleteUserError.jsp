<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>obrisi usera error</title>
</head>
<body>

<h1>Nisi dobro uradio nesto! Molim te ponovi postupak!</h1><br><br>
<a href = "administrator.jsp">back to admin page</a><br><br>

	<form action="../DeleteUserServlet">
		User: 		<input type="text" 	name = "userName"><br><br>
					<input type="submit"   value ="OBRISI">
	</form>
</body>
</html>