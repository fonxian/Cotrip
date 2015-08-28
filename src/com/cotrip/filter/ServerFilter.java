package com.cotrip.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.Manager;
import com.cotrip.bean.MeetingManager;
import com.cotrip.bean.User;

public class ServerFilter extends HttpServlet implements Filter{

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub

		
		//判断用户是否登录
		HttpServletRequest req=(HttpServletRequest)request;   
		HttpServletResponse resp=(HttpServletResponse)response;   
		MeetingManager user = (MeetingManager) req.getSession().getAttribute("server");     
		//如果没有登陆，则重新定向     
		if (user == null)
		{   
			resp.sendRedirect("../adminLogin.jsp");      
		}
		else{
		//	System.out.println(user.getManageremail());
			chain.doFilter(request, response);
		}
		
		
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
