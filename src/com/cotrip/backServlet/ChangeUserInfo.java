package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.User;
import com.cotrip.daoimp.UserImp;

public class ChangeUserInfo extends HttpServlet {


	public ChangeUserInfo() {
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
		String userID=request.getParameter("userID");
		String password=request.getParameter("password");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String country=request.getParameter("country");
		String city=request.getParameter("city");
		String title=request.getParameter("title");
		String education=request.getParameter("education");
		String company=request.getParameter("company");
		String mobnumber=request.getParameter("mobnumber");
		String telnumber=request.getParameter("telnumber");
		String address=request.getParameter("address");
		String postcode=request.getParameter("postcode");
		String status=request.getParameter("status");
		//System.out.println("用户ID："+userID);
		User user=new User();
		user.setUserID(userID);
		user.setPassword(password);
		user.setAge(age);
		user.setSex(sex);
		user.setCountry(country);
		user.setCity(city);
		user.setTitle(title);
		user.setEducation(education);
		user.setCompany(company);
		user.setMobnumber(mobnumber);
		user.setTelnumber(telnumber);
		user.setAddress(address);
		user.setPostcode(postcode);
		user.setStatus(status);
		
		UserImp dao=new UserImp();
		if(dao.changeUserInfo(user))
		{
			out.print("修改成功！");
		}
		else
		{
			out.print("修改失败！<a href='javascript:history.go(-1);'>返回</a>");
		}
		

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
