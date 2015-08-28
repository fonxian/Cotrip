package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.Meeting;
import com.cotrip.daoimp.MeetingImp;

public class ChangeMeeting extends HttpServlet {

	public ChangeMeeting() {
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
		String meetingID=request.getParameter("meetingID");
		String meetinganame=request.getParameter("meetinganame");
		String meetingname=request.getParameter("meetingname");
		String website=request.getParameter("website");
		String organization=request.getParameter("organization");
		String begintime=request.getParameter("begintime");
		String endtime=request.getParameter("endtime");
		
		String holdcountry=request.getParameter("holdcountry");
		String holdcity=request.getParameter("holdcity");
		String place=request.getParameter("place");
		String brief=request.getParameter("brief");
		String content=request.getParameter("content");
		String contactperson=request.getParameter("contactperson");
		String remark=request.getParameter("remark");

		Meeting m=new Meeting();
		m.setMeetingID(meetingID);
		m.setMeetinganame(meetinganame);
		m.setMeetingname(meetingname);
		m.setWebsite(website);
		m.setOrganization(organization);
		m.setBegintime(begintime);
		m.setEndtime(endtime);
		m.setHoldcity(holdcity);
		m.setHoldcountry(holdcountry);
		m.setPlace(place);
		m.setBrief(brief);
		m.setContent(content);
		m.setContactperson(contactperson);
		m.setRemark(remark);
		
		MeetingImp dao=new MeetingImp();
		if(dao.changeMeeting(m))
		{
			out.print("修改成功！");
		}
		else
		{
			out.print("修改失败！<a href='javascript:history.go(-1);'>返回</a>");
		}
		
	}

	public void init() throws ServletException {
	}

}
