package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.Manager;
import com.cotrip.bean.Meeting;
import com.cotrip.daoimp.ManagerImp;
import com.cotrip.daoimp.MeetingImp;

public class ApplyMeeting extends HttpServlet {


	public ApplyMeeting() {
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
		
		String managername=request.getParameter("managername");
		String mobnumber=request.getParameter("mobnumber");
		String manageremail=request.getParameter("manageremail");
		String managerpassword=request.getParameter("managerpassword");
		String userID=null;
		Manager m=new Manager();
		m.setManageremail(manageremail);
		m.setManagername(managername);
		m.setManagerpassword(managerpassword);
		m.setMobnumber(mobnumber);
		ManagerImp dao=new ManagerImp();
		boolean res=true;
		
		//会议组织者邮箱已经被注册，从manager表中查找
		if(dao.haveManagerByEmail(manageremail))
		{
			out.print(manageremail+"邮箱已被注册<a href='javascript:history.go(-1);'>返回</a>");
			return ;
		}
		
		//往manager表中添加会议组织者用户名密码等信息
		if(!dao.addManager(m))
		{
			res=false;
		}
		if(!res)
		{
			out.print("管理员注册失败<a href='javascript:history.go(-1);'>返回</a>");
			return;
		}
		if(res)
		{
			userID=dao.getManagerByEmail(manageremail).getManagerID();
		}
		
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
		
		System.out.println(meetingID+" "+meetinganame+" "+meetingname+" "+website);
		System.out.println(organization+" "+begintime+" "+endtime+" "+holdcity);
		System.out.println(holdcountry+" "+brief+" "+content+" "+contactperson);
		System.out.println(remark);
		
		Meeting meeting=new Meeting();
		meeting.setMeetingID(meetingID);
		meeting.setMeetinganame(meetinganame);
		meeting.setMeetingname(meetingname);
		meeting.setWebsite(website);
		meeting.setOrganization(organization);
		meeting.setBegintime(begintime);
		meeting.setEndtime(endtime);
		meeting.setHoldcity(holdcity);
		meeting.setHoldcountry(holdcountry);
		meeting.setPlace(place);
		meeting.setBrief(brief);
		meeting.setContent(content);
		meeting.setContactperson(contactperson);
		meeting.setRemark(remark);
		meeting.setManagerID(userID);
		meeting.setManagername(managername);
		
		MeetingImp md=new MeetingImp();
		if(!md.addMeeting(meeting))
		{
			res=false;
		}
		if(!res)
		{
			dao.delManagerByID(userID);
			out.print("会议注册失败<a href='javascript:history.go(-1);'>返回</a>");
		}
		if(res)
		{
			out.println("<!DOCTYPE HTML>");
			out.println("<HTML><HEAD>");
			out.println("<script type='application/javascript'>"
					+ "var v = setTimeout(goHome,3000);"
					+ "function goHome() {window.location = '../main/index.jsp';}"
					+ "function goError() {window.location = '../';}" + "</script>");
			out.println("<TITLE>登录</TITLE></HEAD>");
			out.println("<BODY>");
			out.print("会议注册成功，请等待管理员审核，3秒后跳转到首页。<a href='../main/index.jsp'>点此直接跳转</a>");
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		}
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
