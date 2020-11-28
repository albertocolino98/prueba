<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Proyecto ASR new...</title>
</head>
<body>
<h1>Ejemplo de Proyecto de ASR con Cloudant ahora con DevOps Alberto Colino Ruipérez modificado para la integracion continua</h1>
<hr />
Son las <%= new java.util.Date() %>
Practica final 


<p>ZZZZZ Opciones <b>CLOUDANT o ZZZZZZ n IBM Cloud</b>:</p>
<form method ="GET" action ="insertar">
	<ul>

	<li><a href="listar">Listar</a></li>
	<!-- <li><a href="insertar?palabra=hola">Insertar:</li> -->
	Clave API Nueva: </a><input type ="text" name ="claveAPI">
	<li><a href="AnalisisLP">Insertar: </a><input type ="text" name ="palabra"><input type="submit" value="Guardar en Cloudant"></li>
	</ul>
</form>
</body>
</html>