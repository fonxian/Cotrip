package com.qq.connect.demo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.daoimp.UserImp;

public class qqLogin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("username");
		String password = request.getParameter("password");
		UserImp u = new UserImp();
		
		if (u.isUser(email, password)){
			HttpSession session = request.getSession();
			String openId = (String)session.getAttribute("openID");
			String nickName = (String)session.getAttribute("nickName");
			u.setQQInfo(openId, nickName, email, password);
			request.getRequestDispatcher("servlet/UserLogin").forward(request, resp);
		}
		else{
			request.getRequestDispatcher("/qqError").forward(request, resp);
		}
		
	}

}
