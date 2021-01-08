<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style ="height:100%;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3pro.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<title>Práctica final ASR	</title>
	 <style>
	 	input[type=text], select 
	 	{
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  box-sizing: border-box;
		}
		body{
	        height: 100%;
	        background: #d8f0fb	;
	        background-size: cover;
      	}
      	html{
      		heigh: 100%;
      	}
	 </style>
	<script>
		function pulsado() 
	    {  
			
			var dataEnvio = $("#idForm").serialize() + "&nombre=" + localStorage.getItem("nombre");
			$.get('listar', dataEnvio , function(data) 
			{			
				 //alert(data);
		         $('#caja').val(data);
		         
		         $('#mensaje').val("");  
		         $("#mensaje").focus(); 
		     	
           			
       		});
 		  	
	    }
		function pulsado3()
		{
			var dataEnvio = $("#idForm").serialize() + "&nombre=" + localStorage.getItem("nombre");
			$.get('traducir', dataEnvio, function(data) 
			{					 
					
				var quote = $('#caja').text();   
	         	$('#caja').val(quote + data);		         
		         $('#mensaje').val("");  
		         $("#mensaje").focus();        			
       		});
		}
		function pulsado2()
		{
			alert($('#mensaje').val());
			$.get('analizar', $("#idForm").serialize(), function(data2) 
			{	
				$('#caja2').val(data2);				         
	         	$('#mensaje').val("");  
		        $("#mensaje").focus(); 
		     	
           			
       		});
		}
		function pulsado5()
		{
			var explicacion= "1. Nuestra practica final consiste en un chat\n 2. Si pulsa el primer boton, se manda el mensaje \n 3. Si pulsa el boton de traducir, se manda el mensaje traducido, usando el servicio de translate \n 4. Si pulsa el boton de NLP, en la caja de la derecha se mostrara el resultado del analisis por lenguaje natural, usando el servicio de ibm de NLP. Si ve que no aparece nada, pruebe a poner una frase mas clara, con sujeto y predicado. \n 5. Si pulsa el boton del microfono, podra escuchar una grabacion en la que se dice la palabra que quiere mandar, usando el servicio de text2speech";
			alert(explicacion);
			
		}
		function pulsado4()
		{
			/*
			var msgn = document.getElementById("mensaje").value; 
			
			var dataEnvio = $("#idForm").serialize();
			*/
			
			//
			//alert("reproducir?mensaje="+msgn);
			//audio.src="reproducir?mensaje="+msgn;
			//alert($('#mensaje').val());			
			$("#idForm").submit();
			
			
			/*
			$.ajax({
			    type: "get", url: "reproducir2",
			    success: function (text) {
			        alert(text);
			    },
			    error: function (request, status, error) {
			        alert(error + status + request.responseText);
			    }
			});
			*/
			/*
			$.ajax({
			    type: "get", url: "reproducir",
			    success: function (text) {
			        alert(text);
			    },
			    error: function (request, status, error) {
			        alert(error + status + request.responseText);
			    }
			});
			*/
			
			//var audio = document.createElement('audio');
			 
			//audio.setAttribute('src','media/hello_world.mp3');
			//audio.setAttribute('type','audio/mpeg');
			//audio.load();
			//audio.play();
			
			/*
			
			
			$.get('reproducir',dataEnvio
			
			*/
		}
		function nombreUser()
		{
			
			while(nombre==null ||nombre=="" )
			{
				var nombre = prompt("Cual es tu nombre?", "");
				localStorage.setItem("nombre", nombre);
				$.get('listarv', {dataEnvio : "hola"} , function(data9) 
				{			
					 
			         $('#caja').val(data9);			         
			         $('#mensaje').val("");  
			         $("#mensaje").focus(); 			     	
	           			
	       		});
				
			}
			
		}
    </script>
     
</head>
<body  onload="nombreUser();" style =" background-color:#d8f0fb">
	<center>
	<h1> Practica Final ASR </h1>
	<h2>Ana Urbistondo y Alberto Colino</h2>
	</center>
	<hr />
	<div style ="margin-left:10%; margin-right:15%;width:85%;">
		<div   >
			<textarea readonly="readonly" style ="width:44%;display:inline-block"  rows="20" cols="20" id="caja"></textarea>
			
			<textarea readonly="readonly" style ="width:40%; display:inline-block" rows="20" cols="10" id="caja2"></textarea> 
		</div>	
		<form method ="GET" action ="reproducir" id ="idForm">
		<br>
			<div >
				<span style="display: inline-block!;width: 100%;text-align: center;">
					<input   style="width: 60%" type="text" id ="mensaje" name ="mensaje" placeholder="mensaje">
					<button class="btn btn-primary" id ="btn_add"  onclick="pulsado(); return false" data-ignore="push"> <i class="material-icons">send</i> </button>
					<button class="btn btn-primary" id ="btn_add2" onclick="pulsado3(); return false" data-ignore="push"><i class="material-icons">translate</i></button>
					<button class="btn btn-primary" id ="btn_add3" onclick="pulsado2(); return false" data-ignore="push"> NLP</button>
					<button class="btn btn-primary" id ="btn_add4" onclick="pulsado4(); return false" data-ignore="push"> <i class="material-icons">mic</i></button>
					<button class="btn btn-primary" id ="btn_add5" onclick="pulsado5(); return false" data-ignore="push"> Explicacion practica</button>
				</span>
			</div>	
			<div> 
				
				<audio id="audioPlay" style ="display:none;" controls>
					<source id="idAudios" src="reproducir?mensaje="<%=request.getParameter("mensaje") %> type="audio/mpeg">
				</audio>
				 
				
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