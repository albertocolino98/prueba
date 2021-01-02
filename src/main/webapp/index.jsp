<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3pro.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
	<title>Práctica final ASR	</title>
	 
	<script>
		function pulsado(tipo) 
	    {  
			
			//return false;
			
			var tipo2 = tipo.toString();
			var dataEnvio = $("#idForm").serialize() + "&nombre=" + localStorage.getItem("nombre") + "&isTraducido="+tipo2;
			$.get('listar', dataEnvio , function(data) 
			{
			     //msge = localStorage.getItem("nombre") + ": " + data;
			     
				 var quote = $('#caja').text();   
		         $('#caja').val(quote + data);
		         
		         //$('#mensaje').val("");  		         $("#mensaje").focus(); 
		     		         
		         $.get('analizar', dataEnvio , function(data2) 
     			 {     			        			     
     				 $('#caja2').val(data2);
     		         $('#mensaje').val("");
     		         $("#mensaje").focus(); 
            	 });
           			
       		});
 		  	
	    }
		function nombreUser()
		{
			
			while(nombre==null ||nombre=="" )
			{
				var nombre = prompt("Cual es tu nombre?", "");
				localStorage.setItem("nombre", nombre);
				$("#mensaje").focus(); 
				
			}
			
		}
    </script>
     
</head>
<body onload ="nombreUser();">
	<h1> Practica Final ASR Ana Urbistondo y Alberto Colino</h1>
	<hr />
	<div style ="margin-left:10%; margin-right:15%">
		<div  style ="width:85%;" >
			<textarea  style ="width:100%;"  rows="20" cols="20" id="caja"></textarea>
			<textarea style ="width:65%; display:inline-block" rows="10" cols="20" id="caja2"></textarea> 
		</div>	
		<form method ="GET" action ="insertar" id ="idForm">
		<br>
			<div>
				<input style ="width:50%" type="text" id ="mensaje" name ="mensaje" placeholder="Escribe un mensaje">
				<button id ="btn_add" onclick="pulsado(1); return false" data-ignore="push"> Enviar </button>
				<button id ="btn_add" onclick="pulsado(0); return false" data-ignore="push"> Enviar traducido </button>
			</div>	
		</form>
	</div>
		<!-- 
		<ul>	
			<li><a href="listar">Listar</a></li>
			
			<!-- <li><a href="insertar?palabra=hola">Insertar:</li> 
			<li>Clave API Nueva: <input type ="text" name ="claveAPI"></li>
			
			<li><a href="insertar">Insertar: </a><input type ="text" name ="palabra"><input type="submit" value="Guardar en Cloudant"></li>
		</ul>
		 -->
	

	
</body>
</html>