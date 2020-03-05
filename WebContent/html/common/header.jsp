<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>FlashEat</title>
<meta charset="ISO-8859-1" />
<link rel="stylesheet" href="/FlashEat/css/flasheat.css" />
<link rel="shortcut icon" href="/FlashEat/img/FlashEatLogo.ico" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/FlashEat/js/jquery-3.4.1.min.js"></script>
<script src="/FlashEat/js/jquery-ui.js"></script>
</head>
<body>
	<div id="containter">
		<div id="top">
			<div id="top1">
				<div id="top1_1">
					<a href="/FlashEat/html/home.jsp"><img
						src="/FlashEat/img/FlashEatLogo.png" /></a>
				</div>
				<div id="top1_2">
					<h1>Flash Eat</h1>
				</div>
			</div>
			<div id="top2">
				<div id="top2_1">
					<% 
                  	if (request.getSession().getAttribute("usuario") != null) {
                 		 %>
					<%@include file="/html/common/user-menu.jsp"%>
					<%
                  	} else {
                 		 %>
					<%@include file="/html/common/signin-panel.jsp"%>
					<%
						}
					%>
					<div class="contenedor" style="
    position: relative;
    display: inline-block;
    text-align: center;
"><a href="shopping-cart-menu.jsp"><img src="/FlashEat/img/carrito.png"></a>
						 <div class="centrado" style="
    position: absolute;
    top: 35%;
    left: 55%;
    transform: translate(-50%, -50%);
    color: white;
">1</div></div>
				</div>
				<div id="top2_2">
					<a href="/FlashEat/html/home.jsp"><img
						src="/FlashEat/img/chapa-bandera-espana.png" /></a> <a
						href="/FlashEat/html/home.jsp"><img
						src="/FlashEat/img/chapa-bandera-britanica.png" /></a>
				</div>
			</div>
		</div>