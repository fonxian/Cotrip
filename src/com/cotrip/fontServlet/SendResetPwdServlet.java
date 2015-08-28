package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.User;
import com.cotrip.common.email.EmailUtils;
import com.cotrip.daoimp.UserImp;

/**
 * 发送重设密码申请的链接
 */
public class SendResetPwdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String email = request.getParameter("email");
		String username = request.getParameter("username");

		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD>");
		out.println("<TITLE>找回密码</TITLE></HEAD>");
		out.println("<BODY>");

		String content = "";
		if (email != null) {
			UserImp userDao = new UserImp();
			ArrayList<User> list = userDao.queryUserByEmail(email);
			if (!list.isEmpty()) {
				User user = list.get(0);
				if (user.getUsername().equals(username.trim())) {
					String baseUrl = request.getScheme() + "://"
							+ request.getServerName() + ":"
							+ request.getServerPort() + request.getContextPath()
							+ "/resetPwd";

					String random_code = "2" + UUID.randomUUID().toString();// 重新设置密码为标志位2+UUID

					if (userDao.updateRandom_code(email, random_code)
							&& EmailUtils.sendResetPasswordEmail(baseUrl, email,
									random_code)) {
						// 发送重新设置密码的链接
						content = "您的申请已提交成功，请查看您的" + email + "邮箱。<a href='javascript:history.go(-1)'>返回</a>";
					} else {
						content = "发送失败，请稍后再试！<a href='javascript:history.go(-1)'>返回</a>";
					}
				} else {
					content = "用户名和邮箱不匹配！<a href='javascript:history.go(-1)'>返回</a>";
				}
			} else {
				content = "用户不存在!<a href='javascript:history.go(-1)'>返回</a>";
			}
		} else {
			content = "用户不存在!<a href='javascript:history.go(-1)'>返回</a>";
		}
		out.println(content);
		out.println("</body></html");
		out.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
