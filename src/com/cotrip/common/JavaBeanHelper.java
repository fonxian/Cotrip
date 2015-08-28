/*
 * 功能：应用反射机制对JavaBean中的域进行复制
 */
package com.cotrip.common;
import java.lang.reflect.Field;
import java.util.*;
import java.util.Map.Entry;


public class JavaBeanHelper {

	//对javabean对象的域进行顺序赋值
	public static Object evaluate(Object obj,Object [] args) {
		
    	if (obj == null) {
    		return null;
    	} else if (args == null){
    		return obj;
    	}
		
		Class objClass = obj.getClass();
		Field[] fields = objClass.getDeclaredFields(); //得到定义的所有的域
		for (int i = 0; i < args.length ;i++) {
			fields[i].setAccessible(true);   //设置允许访问权限
			String type = fields[i].getGenericType().toString();
			Object objArgument =  args[i];
		    if (type.equals("short"))	{
				objArgument = new Short(objArgument.toString());
 			} else if (type.equals("int"))	{
				objArgument = new Integer(objArgument.toString());
 			} else if (type.equals("long"))	{
				objArgument = new Long(objArgument.toString());
 			} else if (type.equals("double")) {
 				objArgument = new Double(objArgument.toString());
 			} else if (type.equals("float")) {
 				objArgument = new Float(objArgument.toString());
 			} else if (type.equals("char")) {
 				objArgument = new Character(objArgument.toString().charAt(0));
 			} else if (type.equals("byte")) {
 				objArgument = new Byte(objArgument.toString());
 			} else if (type.equals("boolean")) {
 				objArgument = new Boolean(objArgument.toString());
 			} 
			try {
				fields[i].set(obj,objArgument);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			fields[i].setAccessible(false);
		}		
		return obj;
	}
	

    /**
     * 通过java反射机制实现对javabean定义的域进行赋值
     * argument obj 传入的是javabean对象
     * arguemnt key_args 传入的是域名与对应的值
     * return 返回传入的javabean对象
     */
    public static Object evaluate(Object obj,Map<String,Object> key_args) {
		
    	if (obj == null) {
    		return null;
    	} else if (key_args == null){
    		return obj;
    	}
    	
		Class objClass = obj.getClass();    //得到对象的类对象
		
		Set<Map.Entry<String, Object>> entries = key_args.entrySet();
		Iterator it  = entries.iterator();
		
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = (Entry<String, Object>) it.next();
		    Field field = null; 
			try {
				field = objClass.getDeclaredField(entry.getKey()); //得到名为entry.getKey()的域
			} catch (SecurityException e1) {
				e1.printStackTrace();
			} catch (NoSuchFieldException e1) {
				System.out.println("not found such field!");
				e1.printStackTrace();
			}			
		    field.setAccessible(true);    //将该域的访问权限设置为：可访问
		    String type = field.getGenericType().toString();  //得到该域的数据类型
		    Object objArgument =  entry.getValue();           //根据该域的数据类型赋予相应类型的值
		    if (type.equals("short"))	{
				objArgument = new Short(objArgument.toString());
 			} else if (type.equals("int"))	{
				objArgument = new Integer(objArgument.toString());
 			} else if (type.equals("long"))	{
				objArgument = new Long(objArgument.toString());
 			} else if (type.equals("double")) {
 				objArgument = new Double(objArgument.toString());
 			} else if (type.equals("float")) {
 				objArgument = new Float(objArgument.toString());
 			} else if (type.equals("char")) {
 				objArgument = new Character(objArgument.toString().charAt(0));
 			} else if (type.equals("byte")) {
 				objArgument = new Byte(objArgument.toString());
 			} else if (type.equals("boolean")) {
 				objArgument = new Boolean(objArgument.toString());
 			} 				
			try {
				field.set(obj,objArgument);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			field.setAccessible(false);
		}		
		return obj;
	}
	
	public static void main(String[] args) {

		
	}
	
}


