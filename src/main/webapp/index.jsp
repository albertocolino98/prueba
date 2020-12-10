<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3pro.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
	<title>Practica final ASR	</title>
	<!-- 
	<script>
		$("#btn_add").click( function() 
	    {  
		   var postData = $("#formdata").serialize();
           postData[postData.length] = { name: "tok", value: tok };
           $.post(servidor+"crearnecesidad.php",data,function(res){
               if(res == 1){
                   window.location = "main.html?tok="+tok;
               }else{
                   alert(res);
                   
               }
           });
	            
	        }else{
	            alert("Complete los campos obligatorios")
	        }
	
	    });
    </script>
     -->
</head>
<body>
	<h1>Ejemplo de Proyecto de ASR con Cloudant ahora con DevOps Alberto Colino Ruipérez modificado para la integracion continua</h1>
	<hr />
		Son las <%= new java.util.Date() %>
		Practica Traductor
		<p>ZZZZZ Opciones <b>CLOUDANT o ZZZZZZ n IBM Cloud</b>:</p>
		
	<form method ="GET" action ="insertar">
		<ul>	
			<li><a href="listar">Listar</a></li>
			
			<!-- <li><a href="insertar?palabra=hola">Insertar:</li> -->
			<li>Clave API Nueva: <input type ="text" name ="claveAPI"></li>
			
			<li><a href="insertar">Insertar: </a><input type ="text" name ="palabra"><input type="submit" value="Guardar en Cloudant"></li>
		</ul>
	</form>
	<textarea rows="2" cols="10">
	
	</textarea>
	<button id ="btn_add"> Boton </button>
</body>
</html>