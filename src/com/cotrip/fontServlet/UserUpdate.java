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

public class UserUpdate extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserUpdate() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
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

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String username = request.getParameter("username");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String title = request.getParameter("title");
		String education = request.getParameter("education");
		String company = request.getParameter("company");
		String mobnumber = request.getParameter("mobnumber");
		String telnumber = request.getParameter("telnumber");
		String address = request.getParameter("address");
		String postcode = request.getParameter("postcode");

		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		UserImp u = new UserImp();
		out.println("<!DOCTYPE HTML>");
		out.println("<HTML><HEAD>");
		out.println("<script type='application/javascript'>"
				+ "var v = setTimeout(goHome,1000);"
				+ "function goHome() {window.location = '../user/index.jsp';}"
				+ "function goError() {window.location = '../';}" + "</script>");
		out.println("<TITLE>登录</TITLE></HEAD>");
		out.println("<BODY>");
		if (session != null) {
			Object o = session.getAttribute("curuser");
			if (o == null) {
				out.println("尚未登录或已经退出");
			} else {
				User user = (User) o;
				user.setUsername(username);
				user.setAddress(address);
				user.setAge(age);
				user.setCity(city);
				user.setCompany(company);
				user.setCountry(country);
				user.setEducation(education);
				user.setMobnumber(mobnumber);
				user.setPostcode(postcode);
				user.setSex(sex);
				user.setTelnumber(telnumber);
				user.setTitle(title);
				session.setAttribute("curuser", user);

				UserImp ui = new UserImp();
				ui.updateUser(user);
				out.println("<script type='application/javascript'>alert('更新成功');</script>");
			}
		} else {
			out.println("session对象获取失败。请稍后再试。");
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
