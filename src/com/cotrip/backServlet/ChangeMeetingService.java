package com.cotrip.backServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cotrip.bean.MeetingService;
import com.cotrip.daoimp.MeetingServiceImp;

public class ChangeMeetingService extends HttpServlet {


	public ChangeMeetingService() {
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
		String serviceperson=request.getParameter("serviceperson");
		String contactnumber=request.getParameter("contactnumber");
		String city=request.getParameter("city");
		String country=request.getParameter("country");
		String remark=request.getParameter("remark");
		String serviceID=request.getParameter("serviceID");
		
		System.out.println(serviceperson+"电话"+contactnumber+"城市"+city+country+remark+serviceID);
		MeetingService ms=new MeetingService();
		ms.setCity(city);
		ms.setContactnumber(contactnumber);
		ms.setCountry(country);
		ms.setServiceID(serviceID);
		ms.setRemark(remark);
		ms.setServiceperson(serviceperson);
		
		MeetingServiceImp dao=new MeetingServiceImp();
		if(dao.changeMeetingService(ms))
		{
			RequestDispatcher fr=request.getRequestDispatcher("/organizer/allservices.jsp");
			fr.forward(request, response);
		}else
		{
			out.print("修改失败！<a href='javascript:history.go(-1);'>返回</a>");
		}
	}


	public void init() throws ServletException {
	}

}
