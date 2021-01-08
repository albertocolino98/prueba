package asr.proyectoFinal.services;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ibm.cloud.sdk.core.http.HttpConfigOptions;
import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.text_to_speech.v1.model.GetVoiceOptions;
import com.ibm.watson.text_to_speech.v1.TextToSpeech;
import com.ibm.watson.text_to_speech.v1.model.SynthesizeOptions;
import com.ibm.watson.text_to_speech.v1.util.WaveUtils;

public class TextoToAudio
{
	public static byte[] reproducir(String frase, String path)
	{
		IamAuthenticator authenticator = new IamAuthenticator("_zS95XZ9EMzxWrvEOGNMbZNJD09vz9LxubBXGPhUSKNR");
		TextToSpeech textToSpeech = new TextToSpeech(authenticator);
		textToSpeech.setServiceUrl("https://api.eu-gb.text-to-speech.watson.cloud.ibm.com/instances/2a314690-7fb9-4815-8915-cea1717d0ba9");
		//HttpConfigOptions configOptions = new HttpConfigOptions.Builder().disableSslVerification(true).build();
		//textToSpeech.configureClient(configOptions);
		
		byte[] bytes = null; 
		
		 SynthesizeOptions synthesizeOptions = new SynthesizeOptions.Builder()
			      .text(frase)
			      .accept("audio/mp3")
			      .voice("en-GB_CharlotteV3Voice")
			      .build();
		  
		  
		  //System.out.println(path);
		  
		  InputStream inputStream = textToSpeech.synthesize(synthesizeOptions).execute().getResult();
		  /*
		  try {
			  InputStream in = WaveUtils.reWriteWaveHeader(inputStream);  
			  bytes = WaveUtils.toByteArray(inputStream);
			  
			  OutputStream out = new FileOutputStream(path);
			  byte[] buffer = new byte[1024];
			  int length;
			  while ((length = in.read(buffer)) > 0) {
			    out.write(buffer, 0, length);
			  }

			  out.close();
			  in.close();
			  inputStream.close();
			} catch (IOException e) {
			  e.printStackTrace();
			}
			*/
		  try {
		      bytes = WaveUtils.toByteArray(inputStream);
		    } catch (IOException e) {
		      e.printStackTrace();
		    } finally {
		      try {
		        inputStream.close();
		      } catch (IOException e) {
		        e.printStackTrace();
		      }
		    }
		
		//return bytes;
		  
		  /*
		   String palabra = "hola";
		   
		  byte[] bytes2 = palabra.getBytes();
		  return bytes2;
		  */
		  return bytes;
	}
}