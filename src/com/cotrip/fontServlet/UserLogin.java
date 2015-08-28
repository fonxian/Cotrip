package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.User;
import com.cotrip.daoimp.UserImp;

public class UserLogin extends HttpServlet {


	public UserLogin() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if(request.getSession().getAttribute("openID") != null){
			doPost(request, response);
			return;
		}
		
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

		HttpSession session = request.getSession();
		
		
		String email ;
		String password;
		String to = null;
		
		email = request.getParameter("username");
		if(email != null){
			password = request.getParameter("password");
		}
		else{
			email= (String) request.getAttribute("username");
			password = (String) request.getAttribute("password");
		}
		
		if (to == null) {
			to = "../user/index.jsp";
		}

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		System.out.println(email + "密码:" + password);
		UserImp u = new UserImp();
		out.println("<!DOCTYPE HTML>");
		out.println("<HTML><HEAD>");
		out.println("<script type='application/javascript'>" + "var to = '"
				+ to + "';" + "var v = setTimeout(goHome,3000);"
				+ "function goHome() {window.location = to;}"
				+ "function goError() {window.location = to;}" + "</script>");
		out.println("<TITLE>登录</TITLE></HEAD>");
		out.println("<BODY>");
		if (session != null) {
			if (session.getAttribute("curuser") != null) {
				out.println("不能重复登录，请先退出当前账户后再试！");
				out.println("<script type='application/javascript'>"
						+ "to = '../';" + "</script>");
			} else {
				if (u.isUser(email, password)) {
					ArrayList<User> curusers = u.queryUserByEmail(email);
					// session.setAttribute("pass", "OK");
					User user = curusers.get(0);
					if (user.getRandom_code() == null
							|| !user.getRandom_code().trim().startsWith("1")) {// 判断是否处于未激活状态
																				// 标志位为2为修改密码
						session.setAttribute("curuser", curusers.get(0));
						
						if((String)session.getAttribute("openID") != null){
							session.removeAttribute("openID");
							session.removeAttribute("nickName");
							out.print("登录成功！！请关闭当前窗口，并刷新主页面！");
							return;
						}
						
						out.print("<script type='application/javascript'> alert('登录成功!');"
								+ "</script>");
						response.setHeader("refresh", "0;URL=" + to);
					} else {
						session.setAttribute("tempuser", curusers.get(0));
						out.println(user.getUsername()
								+ ",您的账号尚未激活，请去邮箱"
								+ user.getEmail()
								+ "中进行激活。<br />如果没有收到激活邮件，<a href = 'ResendActivateEmail'>重新发送激活邮件</a>");
						// 清除跳转
						out.println("<script type='application/javascript'>"
								+ "clearTimeout(v);" + "v = null;"
								+ "</script>");
					}

				} else {
					out.println("<script type='application/javascript'>"
							+ "clearTimeout(v);" + "</script>");
					out.print("<script type='application/javascript'> alert('登录失败!');"
							+ "</script>");
					response.setHeader("refresh", "0;URL=..");
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
	}

}
