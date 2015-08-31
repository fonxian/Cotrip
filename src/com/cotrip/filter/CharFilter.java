package com.cotrip.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CharFilter extends HttpServlet implements Filter{
	private FilterConfig filterConfig;
	private String trargetEncoding=null;

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try{     
			//在控制台输出目标编码  ，并设置编码
		//	System.out.println("trargetEncoding:"+trargetEncoding+"\n");     
			request.setCharacterEncoding(trargetEncoding);  
			response.setCharacterEncoding(trargetEncoding);   
			
			
			chain.doFilter(request,response);    
			}catch (ServletException sx){     
				filterConfig.getServletContext().log(sx.getMessage());       
			}catch (IOException iox){     
				filterConfig.getServletContext().log(iox.getMessage());    
			}
			
		}
	

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;    
		this.trargetEncoding=this.filterConfig.getInitParameter("encoding");
	}

}
