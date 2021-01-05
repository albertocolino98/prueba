package asr.proyectoFinal.servlets;

import java.io.BufferedWriter;
import java.util.Collections;
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

import java.util.ArrayList;
import java.util.*;
/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = {"/listar", "/insertar", "/traducir","/analizar"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		//out.println("<div>");
		
		CloudantPalabraStore store = new CloudantPalabraStore();
		//System.out.println(request.getServletPath());
		switch(request.getServletPath())
		{
			case "/listar":				
				String msg = request.getParameter("mensaje");
				String nombre = request.getParameter("nombre");			
				
				Collection<Palabra> coleccion2 = store.getAll();
				ArrayList<Palabra> newList = new ArrayList<Palabra>(coleccion2);
				Collections.sort(newList);
				
				Palabra ultimapal = newList.get(newList.size() -1 );
				int indice = Integer.parseInt(ultimapal.getName().substring(0,ultimapal.getName().indexOf("#")));
				indice = indice +1;
				String indice2 = String.valueOf(indice);
				String msgGuardar = indice2	 + "#" + nombre + " : " + msg ;
				Palabra palabra2 = new Palabra();
				palabra2.setName(msgGuardar);					
				store.persist(palabra2);	
				
				Collection<Palabra> coleccion3 = store.getAll();
					
				ArrayList<Palabra> newList2 = new ArrayList<Palabra>(coleccion3);
				Collections.sort(newList2);
				String resultado = newList2.toString();
				resultado = resultado.replaceAll("[^:\nA-Za-z]", "");				
				
				/*
				resultado = resultado.replaceAll("[", "");
				resultado = resultado.replaceAll("]", "");
				*/
				out.println(resultado);
				
			break;
			
			case "/analizar":
				String msg2 = request.getParameter("mensaje");
				//msg2="me gusta mucho el futbol";
			
				String resultadoNLP ="";				
				resultadoNLP = AnalisisLP.analizarLenguaje(msg2,"es");
				out.println(String.format("%s", resultadoNLP));
			break;	
			
			case "/traducir":
				Palabra palabra = new Palabra();
				String msg3 = request.getParameter("mensaje");
				
				String nombre2 = request.getParameter("nombre");
				String msgTraducido = Traductor.translate(msg3, "es", "en",false, "");
				String msgGuardar2 = nombre2 + " : " + msgTraducido;
				palabra.setName(msgGuardar2);
				store.persist(palabra);
				Collection<Palabra> coleccion4 = store.getAll();
				String resultado2 =coleccion4.toString();	
				out.println(resultado2);
			break;
						
		}
		//out.println("</div>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
