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
import com.cotrip.common.email.GenerateLinkUtils;
import com.cotrip.daoimp.UserImp;

/**
 * 重设密码
 */
public class ResetPwdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * get请求时发送给用户一个重设密码的表单
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String email = request.getParameter("email");
		String checkCode = request.getParameter("checkCode");

		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD>");
		out.println("<TITLE>重设密码</TITLE></HEAD>");
		out.println("<BODY>");

		String result = "";
		if (email != null && checkCode != null) {
			UserImp userDao = new UserImp();
			ArrayList<User> lists = userDao.queryUserByEmail(email);
			if (!lists.isEmpty()) {
				String randomCode = lists.get(0).getRandom_code();
				if (randomCode.startsWith("2")
						&& GenerateLinkUtils.verifyCheckcode(email, randomCode,
								checkCode)) {// 随机码标志位必须是2
					request.setAttribute("tempuser", lists.get(0));
					request.getRequestDispatcher("resetpassword.jsp").forward(
							request, response);
					return;
				} else {
					// 激活失败
					result = "无效的链接！<a href='javascript:history.go(-1)'>返回</a>";
				}
			} else {
				result = "用户不存在！<a href='javascript:history.go(-1)'>返回</a>";
			}
		} else {
			result = "非法请求！<a href='javascript:history.go(-1)'>返回</a>";
		}
		out.println(result);
		out.println("</body></html");
		out.close();
	}

	/**
	 * post请求接收用户重设密码的表单提交
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String newpass = request.getParameter("newpass");
		String newpass2 = request.getParameter("newpass2");
		String email = request.getParameter("email");
		String checkCode = request.getParameter("checkCode");

		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD>");
		out.println("<TITLE>重设密码</TITLE></HEAD>");
		out.println("<BODY>");

		String result = "";
		if (email != null && checkCode != null) {
			UserImp userDao = new UserImp();
			ArrayList<User> lists = userDao.queryUserByEmail(email);
			if (!lists.isEmpty()) {
				User user = lists.get(0);
				String randomCode = user.getRandom_code();
				if (randomCode.startsWith("2")
						&& GenerateLinkUtils.verifyCheckcode(email, randomCode,
								checkCode)) {// 随机码标志位必须是2
					if (newpass.equals(newpass2)) {
						user.setPassword(newpass);
						// 重设密码成功
						if (userDao.updatePW(user)) {
							userDao.updateRandom_code(email, "");
							result = user.getUsername()
									+ "，重设密码成功！<a href = 'userLogin.html'>登录</a>";
						} else {
							result = user.getUsername() + "，重设密码失败!<a href='javascript:history.go(-1)'>返回</a>";
						}
					} else {
						result = user.getUsername() + "，两次密码不一致!<a href='javascript:history.go(-1)'>返回</a>";
					}
				} else {
					// 重设密码失败
					result = user.getUsername() + "，状态异常!<a href='javascript:history.go(-1)'>返回</a>";
				}
			} else {
				result = "用户不存在。<a href='javascript:history.go(-1)'>返回</a>";
			}
		} else {
			result = "非法请求！<a href='javascript:history.go(-1)'>返回</a>";
		}
		out.println(result);
		out.println("</body></html");
		out.close();
	}

}
