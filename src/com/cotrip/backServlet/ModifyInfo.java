package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.daoimp.ManagerImp;

public class ModifyInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
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
		String mID=request.getParameter("mID");
		String name=request.getParameter("name");
		String mobnumber=request.getParameter("mobnumber");
		
		System.out.println(mID+name+mobnumber);
		ManagerImp dao=new ManagerImp();
		if(dao.changInfoByID(mID, name, mobnumber))
		{
			out.print("修改成功!重新登录可看见更新后的信息");
		}
		else{
			out.print("修改失败!<a href='javascript:history.go(-1);'>返回</a>");
		}
		

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
