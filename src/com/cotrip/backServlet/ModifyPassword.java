package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.daoimp.ManagerImp;
import com.cotrip.daoimp.UserImp;

public class ModifyPassword extends HttpServlet {


	public ModifyPassword() {
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
		String useremail=request.getParameter("inputusr");
		String oldpassword=request.getParameter("inputpwd");
		String password=request.getParameter("inputpwd1");
		
		ManagerImp u=new ManagerImp();
		if(u.isUser(useremail, oldpassword))
		{
			if(u.changPassByemail(useremail, password))
			{
				out.print("password changed!");
			}
			else
			{
				out.print("change false!<a href='javascript:history.go(-1);'>返回</a>");
			}
		}else
		{
			out.print("password is wrong!<a href='javascript:history.go(-1);'>返回</a>");
		}

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
