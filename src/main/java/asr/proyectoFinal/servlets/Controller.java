package asr.proyectoFinal.servlets;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.Buffer;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.cloud.sdk.core.service.exception.NotFoundException;
import com.ibm.cloud.sdk.core.service.exception.RequestTooLargeException;
import com.ibm.cloud.sdk.core.service.exception.ServiceResponseException;

import asr.proyectoFinal.dao.CloudantPalabraStore;
import asr.proyectoFinal.dominio.Palabra;
import asr.proyectoFinal.services.Traductor;
import asr.proyectoFinal.services.AnalisisLP;
import java.util.Collection;
/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = {"/listar", "/insertar", "/hablar","/analizar"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		//out.println("<html><head><meta charset=\"UTF-8\"></head><body>");
		
		CloudantPalabraStore store = new CloudantPalabraStore();
		System.out.println(request.getServletPath());
		switch(request.getServletPath())
		{
			case "/listar":
				/*
				if(store.getDB() == null)
					  
				else
//					out.println("Palabras en la BD Cloudant:<br />" + store.getAll());
				break;
				*/
				String msg = request.getParameter("mensaje");
				String isTraducido = request.getParameter("isTraducido");
				String nombre = request.getParameter("nombre");
				String msgGuardar = nombre + " : " + msg ;
				Palabra palabra = new Palabra();
								
							
				if(isTraducido=="1")
				{
					msg = Traductor.translate(msg, "es", "en",false, "");
					String msgGuardar2 = nombre + " : " + msg ;
					palabra.setName(msgGuardar2);
					store.persist(palabra);
				}
				else if(isTraducido=="0")
				{
					palabra.setName(msgGuardar);
					store.persist(palabra);
				}
				else {
					String resultadoNLP ="";				
					resultadoNLP = AnalisisLP.analizarLenguaje(msg,"es");
					out.println(String.format("%s", resultadoNLP));
				}
				
				//out.println(String.format("%s : %s",nombre, msg));
				out.println(store.getAll());
			break;
			case "/analizar":
				
			break;
			/*	
			case "/insertar":
				Palabra palabra = new Palabra();
				String parametro = request.getParameter("palabra");
				String claveAPI = request.getParameter("claveAPI");

				if(parametro==null)
				{
					out.println("usage: /insertar?palabra=palabra_a_traducir");
				}
				else
				{
					if(store.getDB() == null) 
					{
						out.println(String.format("Palabra: %s", palabra));
					}
					else
					{
						
						//palabra.setName(palabraTraducida);
						String resultadoNLP;
						//resultadoNLP = AnalisisLP.analizarLenguaje(parametro,"es");
						parametro = Traductor.translate(parametro, "es", "en",false, claveAPI);
						palabra.setName(parametro);
						store.persist(palabra);
						
						out.println(String.format("ResultadoTraducion: %s", parametro));	
						out.println(String.format("Almacenada la palabra: %s con la clave de API %s", palabra.getName(),claveAPI));			    	  
					}
				}
				
				break;
				*/
				
		}
		//out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
