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

public class meeting extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");

		HttpSession se = request.getSession(true);
		String meetingID = request.getParameter("id");
		Meeting m=MeetingImp.getMeetingByID(meetingID);
		System.out.println("会议ID"+meetingID);
		se.setAttribute("meetingID", meetingID);
		User user=(User)se.getAttribute("curuser");
		System.out.println(user.getAddress());
		se.setAttribute("user",user);
		se.setAttribute("meeting",m);
		request.getRequestDispatcher("meetingServlet").forward(request, response);
	}
	
		@Override
		protected void doPost(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			this.doGet(request, response);
		}

	}