package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.User;
import com.cotrip.daoimp.UserImp;

public class ChangePassword extends HttpServlet {

	public ChangePassword() {
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

		HttpSession session = request.getSession(false);

		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String newpass2 = request.getParameter("newpass2");

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		UserImp u = new UserImp();
		out.println("<!DOCTYPE HTML>");
		out.println("<HTML><HEAD>");
		out.println("<script type='application/javascript'>"
				+ "var v = setTimeout(goHome,3000);"
				+ "function goHome() {window.location = '../user/index.jsp';}"
				+ "function goError() {window.location = '../';}" + "</script>");
		out.println("<TITLE>修改密码</TITLE></HEAD>");
		out.println("<BODY>");
		if (session != null) {
			Object o = session.getAttribute("curuser");
			if (o == null) {
				out.println("尚未登录或已经退出");
			} else {
				User user = (User) o;
				if (user.getPassword().equals(oldpass)) {
					if (newpass.equals(newpass2)) {
						user.setPassword(newpass);
						session.setAttribute("curuser", user);
						UserImp ui = new UserImp();
						if (ui.updatePW(user)) {
							out.println("修改成功");
						} else {
							out.println("修改失败");
						}
					} else {
						out.println("两次密码不一致");
					}
				} else {
					out.println("原密码错误");
				}
			}
		} else {
			out.println("session对象获取失败。请稍后再试。");
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
