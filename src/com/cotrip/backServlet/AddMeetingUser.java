package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.MeetingJoin;
import com.cotrip.daoimp.MeetingImp;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.UserImp;

public class AddMeetingUser extends HttpServlet{
	
	public void init() throws ServletException{
		
	}
	
	public void destory(){
		super.destroy(); 
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("name").trim();
		String email=request.getParameter("email").trim();
		String meetingid=request.getParameter("meetingID");
		
		String userid = UserImp.getUserIdByNameAndEmail(username,email);
		if(userid == null){
			RequestDispatcher fr=request.getRequestDispatcher("/organizer/ErrorPage/AddMeetingJoinError.jsp?ErrorInfo=输入的用户名不存在！");
			fr.forward(request, response);
			return;
		}
		
		String meetingname = MeetingImp.getMeetingByID(meetingid).getMeetingname();
		MeetingJoin mj = new MeetingJoin();
		mj.setMeetingID(meetingid);
		mj.setMeetingname(meetingname);
		mj.setUserID(userid);
		mj.setUsername(username);
		
		if(MeetingJoinImp.haveMeetingJoin(meetingid, userid) == true){
			RequestDispatcher fr=request.getRequestDispatcher("/organizer/ErrorPage/AddMeetingJoinError.jsp?ErrorInfo=该用户已经被添加到该会议中！");
			fr.forward(request, response);
			return;
		}
		else{
			new MeetingJoinImp().addMeetingJoin(mj);
			RequestDispatcher fr=request.getRequestDispatcher("/organizer/allusers.jsp");
			fr.forward(request, response);
		}
		
	}
	
}
