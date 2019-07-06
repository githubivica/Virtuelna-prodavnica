<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User" %>
<%@ page import="model.Artikal" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>   
<%@page import="dao.AdminDAO"%>
<%@page import="dao.UserDAO"%>     
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
	
		<p>Ovo je administratorova strana. Ovde cu ubaciti stvari koje se ticu administratorskih poslova</p>
		
		<a href = "../index.html">back to index</a> <br><br>
		
	<%
		List<User> listaUsera = new ArrayList<User>();
		listaUsera = AdminDAO.vratiSveUsere();
	%>
	
	<hr>
		<br>
		<a href = "addBalance.jsp"><button>ADD BALANCE</button></a>
		<a href = "deleteUser.jsp"><button>DELETE USER</button></a>
		
		<p> Podesavanje parametara za USERA:
			<select>
				<%
					for(User u: listaUsera){
				%>
					<option><%= u.getUserName() %></option>
				<%
					}
				%>
			</select>
			<a href = "editUser.jsp"><button>EDIT</button></a>
		</p>
		
		
	<table border="1">
		<tr>
			<th> ID        </th>
			<th> USER NAME </th>
			<th> PASSWORD  </th>
			<th> NOVCANIK  </th>
			<th> ULOGA  </th>
			<th> EDIT  </th>
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
				<td><a href = "editUser.jsp"><button>EDIT <%= u.getUserName() %></button></a></td>
			</tr>
		<%
			}
		%>
	</table><br>
	
	
	<hr><br>
		<a href = "addArtikal.jsp"><button>ADD ARTIKAL</button></a><br><br>
	
	<%
		List<Artikal> listaArtikala = new ArrayList<Artikal>();
		listaArtikala = UserDAO.vratiSveArtikle();
	
	%>
	<table border="1">
		<tr>
			<th> ID ARTIKAL  </th>
			<th> IME ARTIKLA </th>
			<th>    CENA     </th>
			<th>   STANJE    </th>
			<th>   POPUST    </th>
		</tr>
		<%
			for(Artikal u: listaArtikala){
		%>
			<tr>
				<td> <%= u.getIdArtikal()   %> </td>
				<td> <%= u.getImeArtikla() %> </td>
				<td> <%= u.getCena() %> </td>
				<td> <%= u.getStanje() %> </td>
				<td> <%= u.getPopust() %> </td>
			</tr>
		<%
			}
		%>
	</table><br>
	
	<hr>
	
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


