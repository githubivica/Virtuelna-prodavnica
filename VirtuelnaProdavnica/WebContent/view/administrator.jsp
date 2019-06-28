<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>   
<%@page import="dao.AdminDAO"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>administrator page</title>
</head>
<body>
	
	<%
	User user = (User)session.getAttribute("ovdeJeUserObjekat");
	%>
	<h1>DOBRODOŠLI <%=user.getUserName() %> </h1>
	

	<h3>OVO JE ADMIN STRANA </h3>
	
		<p>Ovo je administratorova strana. Ovde cu ubaciti stvari koje se ticu administratorskih poslova</p><br>
	
	<%
		List<User> listaUsera = new ArrayList<User>();
		listaUsera = AdminDAO.vratiSveUsere();
	%>
	<table border="1">
		<tr>
			<th> ID        </th>
			<th> USER NAME </th>
			<th> PASSWORD  </th>
			<th> NOVCANIK  </th>
			<th> ULOGA  </th>
		</tr>
		<%
			for(User u: listaUsera){
		%>
			<tr>
				<td> <%= u.getIdUser()   %> </td>
				<td> <%= u.getUserName() %> </td>
				<td> <%= u.getPassword() %> </td>
				<td> <%= u.getNovcanik() %> </td>
				<td> <%= u.getRola() %> </td>
			</tr>
		<%
			}
		%>
	</table><br><br>
	
		<%
		int a = 5;
		int b = 3;
		int rez = a + b;
		String tekst = "Ovo je moj tekst u javi!";
		
		%>
		Adminov omiljeni broj je: <%=rez %> <br>
		A tekst je: <%=tekst %><br>
	
		<% for(int i = 1; i<=5;i++){ %>
	
		BROJ: <%=i %><br>
	
		<%} %>


</body>
</html>


