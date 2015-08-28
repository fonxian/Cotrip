package com.cotrip.fontServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.User;
import com.cotrip.common.email.GenerateLinkUtils;
import com.cotrip.daoimp.UserImp;

/**
 * 激活servlet
 * 
 * @author enjoy
 * @email admin@atiter.com
 * @time 2013-4-29 下午12:17:50
 * 
 */
public class ActivateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String checkCode = request.getParameter("checkCode");
		String result = "";
		if (email != null && checkCode != null) {
			UserImp userDao = new UserImp();
			ArrayList<User> lists = userDao.queryUserByEmail(email);
			if (!lists.isEmpty()) {
				String randomCode = lists.get(0).getRandom_code();
				if (randomCode.startsWith("1")
						&& GenerateLinkUtils.verifyCheckcode(email, randomCode,
								checkCode)) {// 随机码标志位必须是1
					// 激活成功
					if (userDao.updateRandom_code(email, "")) {
						result = lists.get(0).getUsername()
								+ "，激活成功。<a href = 'userLogin.html'>登录</a>";
					} else {
						result = "激活失败！<a href='javascript:history.go(-1)'>返回</a>";
					}
				} else {
					// 激活失败
					result = lists.get(0).getUsername() + "，激活失败。<a href='javascript:history.go(-1)'>返回</a>";
				}
			} else {
				result = "用户不存在，激活失败。<a href='javascript:history.go(-1)'>返回</a>";
			}
		} else {
			result = "非法请求！<a href='javascript:history.go(-1)'>返回</a>";
		}
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
