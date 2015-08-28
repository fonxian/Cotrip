package com.cotrip.backServlet;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.Manager;
import com.cotrip.bean.Meeting;
import com.cotrip.bean.MeetingManager;
import com.cotrip.daoimp.ManagerImp;
import com.cotrip.daoimp.MeetingImp;
import com.cotrip.daoimp.MeetingManagerImp;

public class AdminLogin extends HttpServlet {


	public AdminLogin() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String role=request.getParameter("role");   
		String useremail=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println("role"+role+"username"+useremail+"密码"+password);
		if(role.equals("0"))
		{
			ManagerImp m=new ManagerImp();
			if(m.isUser(useremail, password))
			{
				Manager manager=m.getManagerByEmail(useremail);
				if(manager.getPower().equals("A"))
				{
					request.setAttribute("manager", manager);
					RequestDispatcher fr=request.getRequestDispatcher("/managermain.jsp");
					fr.forward(request, response);
				}else{
					out.print("have no right,login false!<a href='javascript:history.go(-1);'>返回</a>");
				}
			}
			else{
				out.print("login false!<a href='javascript:history.go(-1);'>返回</a>");
			}
		}else if(role.equals("1"))
		{
			ManagerImp m=new ManagerImp();
			if(m.isUser(useremail, password))
			{
				Manager manager=m.getManagerByEmail(useremail);
				if(manager.getPower().equals("M"))
				{
					Meeting meeting=MeetingImp.getMeetingByManagerID(manager.getManagerID());
					request.setAttribute("organizer", manager);
					request.setAttribute("meeting", meeting);
					RequestDispatcher fr=request.getRequestDispatcher("/organizermain.jsp");
					fr.forward(request, response);
				}else{
					out.print("have no right,login false!<a href='javascript:history.go(-1);'>返回</a>");
				}
			}
			else{
				out.print("login false!<a href='javascript:history.go(-1);'>返回</a>");
			}
		}else if(role.equals("2"))
		{
			
			MeetingManagerImp mm=new MeetingManagerImp();
			if(mm.isMeetingManager(useremail, password))
			{
				MeetingManager server=mm.getMeetingManagerByEmail(useremail);
				request.setAttribute("server", server);
				RequestDispatcher fr=request.getRequestDispatcher("/servermain.jsp");
				fr.forward(request, response);
			}else{
				out.print("login false!<a href='javascript:history.go(-1);'>返回</a>");
			}
		}

	}

	public void init() throws ServletException {
	}

}
