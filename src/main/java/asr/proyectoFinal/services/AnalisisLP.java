package asr.proyectoFinal.services;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.ibm.cloud.sdk.core.security.Authenticator;
import com.ibm.cloud.sdk.core.security.IamAuthenticator;

import com.ibm.watson.natural_language_understanding.v1.NaturalLanguageUnderstanding;
import com.ibm.watson.natural_language_understanding.v1.model.AnalysisResults;
import com.ibm.watson.natural_language_understanding.v1.model.AnalyzeOptions;
import com.ibm.watson.natural_language_understanding.v1.model.EntitiesOptions;
import com.ibm.watson.natural_language_understanding.v1.model.Features;
import com.ibm.watson.natural_language_understanding.v1.model.KeywordsOptions;
import com.ibm.watson.natural_language_understanding.v1.model.RelationsOptions;

public class AnalisisLP 
{	
	/*
	public static void main(String[] args) {
		AnalisisLP.analizarLenguaje();
	}
	*/
	public static String analizarLenguaje(String text, String idioma)
	{
		IamAuthenticator authenticator = new IamAuthenticator("N3COdkwNRA-fD2Xv2YZzAQK60ZIl1GKU5kxwNd_i9WvS");
		NaturalLanguageUnderstanding naturalLanguageUnderstanding = new NaturalLanguageUnderstanding("2020-08-01", authenticator);
		naturalLanguageUnderstanding.setServiceUrl("https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/9187d922-8411-4e6c-8378-5610426c76f1");

		
		
		EntitiesOptions entitiesOptions = new EntitiesOptions.Builder()
		  .emotion(true)
		  .sentiment(true)
		  .limit(2)
		  .build();

		KeywordsOptions keywordsOptions = new KeywordsOptions.Builder()
		  .emotion(true)
		  .sentiment(true)
		  .limit(2)
		  .build();
		
		/*
		RelationsOptions relations = new RelationsOptions.Builder()
		  .build();
 
		*/
		
		/*
		Features features = new Features.Builder()
		  .relations(relations)
		  .build();
		*/
		
		Features features = new Features.Builder()
		  .entities(entitiesOptions)
		  .keywords(keywordsOptions)
		  .build();		

		AnalyzeOptions parameters = new AnalyzeOptions.Builder()
		  .text(text)
		  .features(features)
		  .build();

		AnalysisResults response = naturalLanguageUnderstanding
		  .analyze(parameters)
		  .execute()
		  .getResult();
		
		String traduccionJSON = response.toString();
		
		JsonObject rootObj = JsonParser.parseString(traduccionJSON).getAsJsonObject();
		
		//JsonArray analisisNLP = rootObj.getAsJsonArray("keywords");
		
		String analisisConcreto = "NO se ha encontrado tu JSON";
		
		/*
		if(analisisNLP.size()>0)
			analisisConcreto =	analisisNLP.get(0).getAsJsonObject().get("emotion").getAsString();
		 */
		
		System.out.println(response);
		
		//return analisisConcreto;
		return traduccionJSON;
	}

}
