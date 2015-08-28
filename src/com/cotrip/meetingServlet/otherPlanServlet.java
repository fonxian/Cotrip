package com.cotrip.meetingServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.Response;
import com.cotrip.bean.User;
import com.cotrip.daoimp.MeetingImp;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.ResponseImp;
import com.cotrip.daoimp.TravelPlanImp;

public class otherPlanServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession se=request.getSession(true);
		
		  User user=(User)se.getAttribute("user");
		  String meetingID =(String)se.getAttribute("meetingID");
		  String userID=user.getUserID();
		  
		  String what=request.getParameter("what");
		  
		  //Dao
		  MeetingJoinImp mji=new MeetingJoinImp();
		  TravelPlanImp  tpl=new TravelPlanImp();
		  ResponseImp  ri=new ResponseImp();
		  MeetingImp  mi=new MeetingImp();
		  
		  
		  
		if("changeReponse".equals(what)){
				Response rs=(Response)se.getAttribute("myresponse");
				
				rs.setUsername(request.getParameter("username"));
				rs.setEmail(request.getParameter("email"));
				rs.setNumber(request.getParameter("number"));
				rs.setRemark(request.getParameter("remark"));
				rs.setStatus(request.getParameter("status"));
				
				System.out.println(rs.getEmail()+rs.getUsername()+rs.getNumber()+rs.getRemark()+rs.getStatus()+rs.getResponseID());
				boolean ok=ri.updateReponseByID(rs);
				if(ok){
					request.getRequestDispatcher("meeting/meetingplan/sharedePlan.jsp?error=success").forward(request, response);
				}
				
		}else if("system".equals(what)){
			request.getRequestDispatcher("meeting/meetingplan/otherPlanServlet.jsp?chooice=system").forward(request, response);
		}else if(what.equals("otherplan")){
			request.getRequestDispatcher("meeting/meetingplan/otherPlanServlet.jsp?chooice=all").forward(request, response);
		}else if(what.equals("onlyshared")){ 
			request.getRequestDispatcher("meeting/meetingplan/otherPlanServlet.jsp?chooice=onlyshared").forward(request, response);
		}else if(what.equals("sharedplan")&&!tpl.haveTravelPlan(meetingID, userID)&&!tpl.haveTravelPlan(meetingID, userID)){
			boolean ok2=ri.addResponse(userID, request.getParameter("planid"), request.getParameter("email"), request.getParameter("username"), request.getParameter("number"), request.getParameter("remark"), request.getParameter("status"));
            if(ok2){
            	request.getRequestDispatcher("meeting/meetingplan/sharedePlan.jsp?error=success").forward(request, response);
            }else{
            	request.getRequestDispatcher("meeting/meetingplan/sharedePlan.jsp?error=fail").forward(request, response);
            }
		}else{
			request.getRequestDispatcher("meeting/meetingplan/sharedePlan.jsp?error=havaplan").forward(request, response);
		}
		
	    
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		 this.doGet(request,response);
	}
   
}
