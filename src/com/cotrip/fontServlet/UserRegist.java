package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.common.email.EmailUtils;
import com.cotrip.daoimp.UserImp;

public class UserRegist extends HttpServlet {


	public UserRegist() {
		super();
	}


	public void destroy() {
		super.destroy(); 
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

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		String email = request.getParameter("email");

		System.out.println(username + "密码" + password + "邮箱" + email);
		UserImp u = new UserImp();

		out.println("<!DOCTYPE HTML>");
		out.println("<HTML><HEAD>");
		out.println("<TITLE>登录</TITLE></HEAD>");
		out.println("<BODY>");

		if (u.haveUser(email)) {
			out.print("邮箱：" + email
					+ "已经被注册，请换其他邮箱注册或直接登录。<a href='../userLogin.jsp'>登录</a>");
		} else {
			// 标志位+UUID（标志位1表示用户处于未激活状态）
			String random_code = "1" + UUID.randomUUID().toString();
			if (u.addUser(username, password, email, random_code)) {
				// 新增用户成功后，发送邮件
				// 注册成功后,发送帐户激活链接
				String baseUrl = request.getScheme() + "://"
						+ request.getServerName() + ":"
						+ request.getServerPort() + request.getContextPath()
						+ "/ActivateAccount";
				EmailUtils
						.sendAccountActivateEmail(baseUrl, email, random_code);
				out.print(username + "，注册成功！请到" + email
						+ "邮箱中激活账户。<br/><a href='../userLogin.jsp'>登录</a>");
			} else {
				out.print("注册失败，请稍后再试！<a href='javascript:history.go(-1)'>返回</a>");
			}
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();


	}


	public void init() throws ServletException {
	}

}
