package com.cotrip.databaseFactory;

import java.util.Properties;


public class PropertiesRead {
	static Properties pro=new Properties();
	
	static{
		try{
			pro.load(PropertiesRead.class.getClassLoader().getResourceAsStream("config/DBconfig.properties"));
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	};
	public static String getProperty(String key){
		return pro.getProperty(key);
	}

}
