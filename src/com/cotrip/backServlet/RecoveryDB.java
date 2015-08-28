package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.BackDBTool;
import common.util.GetSystemTime;

@SuppressWarnings("serial")
public class RecoveryDB extends HttpServlet {

	public RecoveryDB() {
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
		String recoveryFilename=request.getParameter("selectedFilename");//已经被选择的用来恢复数据库的.sql文件
		//恢复的系统文件名
//		String recoveryFilename="cotrip1.sql";
		try {
			BackDBTool.load(recoveryFilename);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.write("<script type='text/javascript'>" +
				"alert('恭喜，系统数据库恢复成功！')" +
				"</script >");

	}


	public void init() throws ServletException {

	}

}
