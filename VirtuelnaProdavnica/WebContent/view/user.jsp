<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Artikal" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user page</title>
</head>
<body>
	<%
		User user = (User)session.getAttribute("ovdeJeUserObjekat");		//iz LoginServlet
	%>
	<h1>DOBRODOSLI USER</h1>
	ZDRAVO <%=user.getUserName() %> <br>
	
	<h2>ZDRAVO <%=user.getUserName() %></h2><br><br>
	
	<a href = "../index.html">back to index</a> <br><br>

	<h3>STANJE NA VASEM RACUNU JE: <%=user.getNovcanik() %> </h3>

	<%
		UserDAO userDAO = new UserDAO();
		List<Artikal> listaArtikala = userDAO.vratiSveArtikle();
	%>
	<form action="../PlatiRacunServlet" metod="get">
		<table border="1">
			<tr>
				<th>id</th>
				<th>ime</th>
				<th>cena</th>
				<th>popust</th>
				<th>check</th>
				<th>kolicina</th>
			</tr>
			<% 
				for(Artikal a: listaArtikala){
			%>
				<tr>
					<td><%=a.getIdArtikal() %></td>
					<td><%=a.getImeArtikla() %></td>
					<td><%=a.getCena()%></td>
					<td><%=a.getPopust()%></td>
					<td><input type="checkbox" name = "check" value="<%=a.getIdArtikal() %>"></td>
					<td>
						<select name="kolicina">
							<%
								for(int i = 0; i<= a.getStanje(); i++){
							%>
								<option value="<%=i %>"><%=i%></option>
							<% 
								}
							%>
						</select>
					</td>
				</tr>
			<%
				}
			%>	
		</table>
			<input type="submit" value="PLATI RACUN">
	</form>

	
	
</body>
</html>


