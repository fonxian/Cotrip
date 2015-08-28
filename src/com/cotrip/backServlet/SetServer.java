package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.MeetingManager;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.MeetingManagerImp;

public class SetServer extends HttpServlet {


	public SetServer() {
		super();
	}


	public void destroy() {
		super.destroy(); 

	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
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


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String meetingID=request.getParameter("meetingID");
		String userID=request.getParameter("userID");
		String managerID=request.getParameter("managerID");
		String group=request.getParameter("group");
		String managername=MeetingManagerImp.getMeetingManagerByID(managerID).getName();
		
		System.out.println(meetingID+"用户ID"+userID+"管理员Id"+"组"+group+"管理员"+managername);
		
		MeetingJoinImp dao=new MeetingJoinImp();
		if(group==null)
		{
			if(dao.setServer(meetingID, userID, managerID, managername))
			{
				RequestDispatcher fr=request.getRequestDispatcher("/organizer/allusers.jsp");
				fr.forward(request, response);
			}
			else{
				out.print("设置失败！<a href='javascript:history.go(-1);'>返回</a>");
			}
		}else{
			
			if(dao.setServerByGroup(meetingID, userID, managerID, managername))
			{
				RequestDispatcher fr=request.getRequestDispatcher("/organizer/allusers.jsp");
				fr.forward(request, response);
			}
			else{
				out.print("设置失败！<a href='javascript:history.go(-1);'>返回</a>");
			}
		}
		
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
