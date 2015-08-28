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

public class meetingServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");

		HttpSession se = request.getSession(true);

		
		String meetingID =(String)se.getAttribute("meetingID");
		System.out.println(meetingID+"会议ID");
		String what = null;
		what = (String) request.getParameter("what");
		MeetingImp meetinImp = new MeetingImp();

		if (what == null) {
			Meeting meeting = meetinImp.getMeetingByID(meetingID);
			request.setAttribute("meeting", meeting);
			request.getRequestDispatcher("meeting/mymeeting.jsp").forward(
					request, response);
		} else if (what.equals("news")) {
			request.getRequestDispatcher(
					"meeting/mymeetingNewsNotices.jsp?type=N").forward(request,
					response);
		} else if (what.equals("notices")) {
			request.getRequestDispatcher(
					"meeting/mymeetingNewsNotices.jsp?type=P").forward(request,
					response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
