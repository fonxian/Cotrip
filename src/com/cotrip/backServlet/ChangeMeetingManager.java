package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.MeetingManager;
import com.cotrip.daoimp.MeetingManagerImp;

public class ChangeMeetingManager extends HttpServlet {


	public ChangeMeetingManager() {
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
		PrintWriter out = response.getWriter();
		String name=request.getParameter("name").trim();
		String email=request.getParameter("email").trim();
		String password=request.getParameter("password").trim();
		String mobnumber=request.getParameter("mobnumber").trim();
		String remark=request.getParameter("remark").trim();
		String mmID=request.getParameter("mmID");
		
		System.out.println(name+"密码"+password+"邮箱"+email+"电话"+mobnumber+"备注"+remark+"会议ID"+mmID);
		
		MeetingManager mm=new MeetingManager();
		mm.setEmail(email);
		mm.setMmanagerID(mmID);
		mm.setMobnumber(mobnumber);
		mm.setName(name);
		mm.setPassword(password);
		mm.setRemark(remark);
		
		MeetingManagerImp dao=new MeetingManagerImp();
		if(dao.changeMeetingManager(mm))
		{
			out.print("修改成功！");
		}else{
			out.print("修改失败！<a href='javascript:history.go(-1);'>返回</a>");
		}
	}


	public void init() throws ServletException {
	
	}

}
