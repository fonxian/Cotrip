package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.MeetingNewsNotices;
import com.cotrip.bean.SysNewsNotices;
import com.cotrip.daoimp.MeetingNewsNoticesImp;
import com.cotrip.daoimp.SysNewsNoticesImp;

public class ChangeMeetingNewsNotices extends HttpServlet {


	public ChangeMeetingNewsNotices() {
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
		String name=request.getParameter("newname");
		String content=request.getParameter("newcontent");
		String mnnID=request.getParameter("mnnID");
		String type=request.getParameter("type");
		
		System.out.println(name+"内容"+content+"ID"+mnnID);
		MeetingNewsNotices mnn=new MeetingNewsNotices();
		mnn.setMnnname(name);
		mnn.setMnncontent(content);
		mnn.setMnnID(mnnID);
		MeetingNewsNoticesImp dao=new MeetingNewsNoticesImp();
		if(dao.changeMeetingNewNoticesByID(mnn))
		{
			out.print("修改成功！<a href='javascript:history.go(-2);'>返回</a>");
		}else
		{
			out.print("修改失败！<a href='javascript:history.go(-2);'>返回</a>");
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
