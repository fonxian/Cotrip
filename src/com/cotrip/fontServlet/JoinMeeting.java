package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.MeetingJoin;
import com.cotrip.bean.User;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.UserImp;

public class JoinMeeting extends HttpServlet {


	public JoinMeeting() {
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
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("非法登录方式");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mid = request.getParameter("meetingid");
		String mname = request.getParameter("meetingname");
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("curuser");
		MeetingJoinImp mji = new MeetingJoinImp();

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE HTML>");
		out.println("<HTML><HEAD>");
		out.println("<script type='application/javascript'>"
				+ "var to = '../user/MyConferences.jsp';"
				+ "var v = setTimeout(goHome,3000);"
				+ "function goHome() {window.location = to;}"
				+ "function goError() {window.location = to;}" + "</script>");
		out.println("<TITLE>参与会议</TITLE></HEAD>");
		out.println("<BODY><center>");
		if (session != null) {
			if (user == null) {
				out.print("未登陆。<a href='../'>点此直接跳转</a>");
				out.println("<script type='application/javascript'>"
						+ "to = '../userLogin.jsp';"
						+ "</script>");
			} else {
				MeetingJoin mj = mji.getMeetingJoin(mid, user.getUserID());
				if (mj != null) {
					out.println("您已经参与过该会议，不要重复参与！<a href='../user/MyConferences.jsp'>点此直接跳转</a>");
				} else {
					if (mji.addMeetingJoin(mid, user.getUserID(), mname,
							user.getUsername())) {
						out.print("参与成功，正在跳转。<a href='../user/MyConferences.jsp'>点此直接跳转</a>");
					} else {
						out.println("<script type='application/javascript'>"
								+ "clearTimeout(v);"
								+ "</script>");
						out.print("参与失败。<a href='javascript:history.go(-1)'>返回</a>");
					}
				}
			}
		} else {
			out.println("session对象获取失败。请稍后再试。");
		}
		out.println(" </center> </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
	}

}
