package com.cotrip.meetingServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.Meeting;
import com.cotrip.bean.MeetingJoin;
import com.cotrip.bean.Response;
import com.cotrip.bean.TravelPlan;
import com.cotrip.bean.User;
import com.cotrip.daoimp.MeetingImp;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.ResponseImp;
import com.cotrip.daoimp.TravelPlanImp;
import com.cotrip.daoimp.UserImp;

public class planServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession se = request.getSession(true);

		User user = (User) se.getAttribute("user");
		String meetingID = (String) se.getAttribute("meetingID");
		String userID = user.getUserID();

		String what = request.getParameter("what");

		// Dao
		MeetingJoinImp mji = new MeetingJoinImp();
		TravelPlanImp tpl = new TravelPlanImp();
		MeetingImp mi = new MeetingImp();
		UserImp ui = new UserImp();
		ResponseImp ri = new ResponseImp();

		if (user == null) {
			request.getRequestDispatcher("userLogout.jsp").forward(request,
					response);
		} else if (what.equals("myTravelPlan")) {
			String auther = "";
			TravelPlan travelPlan = tpl.getTravelPlanByID(userID, meetingID);
			if (travelPlan != null) {
				auther = "yes";
				ArrayList<Response> Relist = ri.getAllResponseByPlanID(travelPlan.getPlanID());
				request.setAttribute("Relist", Relist);
			}
			if (travelPlan == null) {

				if (ri.getResponseByID(userID, meetingID) != null) {
					auther = "no";
					Response rp = ri.getResponseByID(userID, meetingID);
					ArrayList<Response> Relist=ri.getAllResponseByPlanID(rp.getPlanID());
					request.setAttribute("Relist", Relist);
					se.setAttribute("myresponse", rp);
					travelPlan = tpl.getTravelPlanID(userID);
					travelPlan.setNumber(rp.getNumber());
					travelPlan.setEmail(rp.getEmail());
					travelPlan.setUsername(rp.getUsername());
					travelPlan.setRemark(rp.getRemark());
					travelPlan.setIspublic(rp.getStatus());
//					ArrayList<Response> Relist=ri.getPublicResponseByPlanID(rp.getPlanID());
//					request.setAttribute("Relist", Relist);
				}
			}
			if (travelPlan != null) {
				ArrayList<User> list = tpl
						.getsharedUser(travelPlan.getPlanID());
				request.setAttribute("list", list);
			}
			request.setAttribute("TravelPlan", travelPlan);
			request.getRequestDispatcher(
					"meeting/meetingplan/myTravelPlan.jsp?auther=" + auther)
					.forward(request, response);
		} else if (what.equals("createPlan")) {
			String[] str = request.getParameterValues("apisSelected[]");
			String shared = new String();
			if (str != null) {
				for (int i = 0; i < str.length; i++) {
					shared = shared + str[i] + ",";
				}
			}
			boolean ok2 = tpl.addTravelPlan(userID, meetingID, request
					.getParameter("username"), request
					.getParameter("starttime"), request
					.getParameter("overtime"), request
					.getParameter("startaddress"), request
					.getParameter("overaddress"), request
					.getParameter("method"), request
					.getParameter("tfnumber"),request.getParameter("email"),
					request.getParameter("number"), request
							.getParameter("remark"), shared, request
							.getParameter("ispublic"));
			if (ok2) {
				request
						.getRequestDispatcher(
								"meeting/meetingplan/travelPlan.jsp?error=createSuccess")
						.forward(request, response);
			} else {
				request.getRequestDispatcher(
						"meeting/meetingplan/travelPlan.jsp?error=createFail")
						.forward(request, response);
			}

		} else if (what.equals("create")) {
			TravelPlan havetp = tpl.getTravelPlanByID(userID, meetingID);
			Response haverp = ri.getResponseByID(userID, meetingID);
			if (havetp == null && haverp == null) {
				// ArrayList<User> list=ui.getAllUser();
				int count = MeetingJoinImp
						.getMeetingJoinCountByMeetingID(meetingID);
				List<MeetingJoin> mjlist = MeetingJoinImp.getAllMeetingJoin(
						"1", "" + count, meetingID);
				String holdcity = mi.getMeetingByID(meetingID).getHoldcity();
				request.setAttribute("userlist", mjlist);
				request.getRequestDispatcher(
						"meeting/meetingplan/createPlan.jsp?startaddress="
								+ holdcity).forward(request, response);
			} else {
				request.getRequestDispatcher(
						"meeting/meetingplan/travelPlan.jsp?error=havaplan")
						.forward(request, response);
			}
		} else if (what.equals("createReponse")) {
			String planid = request.getParameter("planid");
			String stauts = request.getParameter("stauts");
			TravelPlan havetp = tpl.getTravelPlanByID(userID, meetingID);
			Response haverp = ri.getResponseByID(userID, meetingID);
			if (havetp == null && haverp == null) {
				request.getRequestDispatcher(
						"meeting/meetingplan/createReponse.jsp?planid="
								+ planid + "&stauts=" + stauts).forward(
						request, response);
			} else {
				request.getRequestDispatcher(
						"meeting/meetingplan/travelPlan.jsp?error=havaplan")
						.forward(request, response);
			}
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
