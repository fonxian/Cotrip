package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.User;
import com.cotrip.common.email.EmailUtils;

/**
 * 重新发送激活邮件
 * 
 * @author enjoy
 * @email admin@atiter.com
 * @time 2013-4-29 下午1:09:56
 * 
 */
public class ResendActivateEmail extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		HttpSession session = req.getSession();
		Object o = session.getAttribute("tempuser");

		PrintWriter out = resp.getWriter();
		out.println("<HTML><HEAD>");
		out.println("<TITLE>重新发送激活邮件</TITLE></HEAD>");
		out.println("<BODY>");

		if (o != null && o instanceof User) {
			User u = (User) o;
			String baseUrl = req.getScheme() + "://" + req.getServerName()
					+ ":" + req.getServerPort() + req.getContextPath()
					+ "/ActivateAccount";
			if (EmailUtils.sendAccountActivateEmail(baseUrl, u.getEmail(),
					u.getRandom_code())) {
				out.print(u.getUsername() + "，激活邮件已经重新发送到您的邮箱中！请到"
						+ u.getEmail()
						+ "邮箱中激活账户。<br/><a href='userLogin.jsp'>登录</a>");
			} else {
				out.print(u.getUsername()
						+ "，激活邮件发送失败！请稍后再试！<br/><a href='userLogin.jsp'>登录</a>");
			}
		} else {
			out.print("非法请求！<br/><a href='userLogin.jsp'>登录</a>");
		}
		out.println("</BODY></HTML>");
		out.close();
	}
}
