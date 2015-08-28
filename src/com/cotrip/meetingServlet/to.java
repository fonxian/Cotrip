package com.cotrip.meetingServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.Meeting;
import com.cotrip.bean.User;
import com.cotrip.daoimp.MeetingImp;
import com.cotrip.daoimp.UserImp;

public class to extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		HttpSession se=request.getSession(true);
		
		  MeetingImp mi=new MeetingImp();
		  UserImp ui=new UserImp();
		  Meeting meeting=mi.getMeetingByID("1");
		  User user=ui.getUserByID("1");
		  se.setAttribute("meeting",meeting);	
		  se.setAttribute("user", user);
		  request.getRequestDispatcher("meetingServlet").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		 this.doGet(request,response);
	}
   
}
