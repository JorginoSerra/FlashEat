<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*, es.flasheat.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultados</title>
</head>
<body>
<%
	List<Restaurante> restaurantes = (List<Restaurante>) request.getAttribute("resultados");
if(restaurantes != null){
	for(Restaurante r: restaurantes){
		%>
		<li><%=r.getNombre()%></li>
		<%
	}
}
%>
</body>
</html>