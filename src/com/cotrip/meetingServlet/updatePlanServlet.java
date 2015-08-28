package com.cotrip.meetingServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cotrip.bean.Meeting;
import com.cotrip.bean.Response;
import com.cotrip.bean.TravelPlan;
import com.cotrip.bean.User;
import com.cotrip.daoimp.MeetingJoinImp;
import com.cotrip.daoimp.ResponseImp;
import com.cotrip.daoimp.TravelPlanImp;
import com.cotrip.daoimp.UserImp;

public class updatePlanServlet extends HttpServlet {

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
		ResponseImp ri = new ResponseImp();
		String planID = request.getParameter("planID");

		boolean ok1 = false;
		boolean ok2 = false;
		if (what.equals("deleteplan")) {
			if (tpl.getTravelPlanByID(userID, meetingID) != null) {
				ArrayList<Response> list = ri.getAllResponseByPlanID(planID);
				if (list == null) {
					ok2 = tpl.deleteTravelPlan(meetingID, userID);
					if (ok2) {
						request
								.getRequestDispatcher(
										"meeting/meetingplan/travelPlan.jsp?delete=success")
								.forward(request, response);
					} else {
						request
								.getRequestDispatcher(
										"meeting/meetingplan/travelPlan.jsp?delete=fail")
								.forward(request, response);
					}
				} else {
					request.setAttribute("responseList", list);
					request.getRequestDispatcher(
							"meeting/meetingplan/changePlanLeader.jsp?planID="
									+ planID).forward(request, response);
				}
			} else {
				ok2 = ri.deleteResponse(meetingID, userID);
				if (ok2) {
					request
							.getRequestDispatcher(
									"meeting/meetingplan/travelPlan.jsp?delete=success")
							.forward(request, response);
				} else {
					request.getRequestDispatcher(
							"meeting/meetingplan/travelPlan.jsp?delete=fail")
							.forward(request, response);
				}
			}
		} else if (what.equals("change")) {
			String leaderID = request.getParameter("apisSelected[]");
			TravelPlan tp = tpl.getTravelPlanByPlanID(planID);
			Response rs = ri.getResponseByID(leaderID, meetingID);
			tp.setUserID(rs.getUserID());
			tp.setEmail(rs.getEmail());
			tp.setUsername(rs.getUsername());
			tp.setNumber(rs.getNumber());
			ok1 = ri.deleteResponse(meetingID, leaderID);
			ok2 = tpl.updateTravelPlan(tp);
			if (ok1 & ok2) {
				request.getRequestDispatcher(
						"meeting/meetingplan/travelPlan.jsp?delete=success")
						.forward(request, response);
			} else {
				request.getRequestDispatcher(
						"meeting/meetingplan/travelPlan.jsp?delete=fail")
						.forward(request, response);
			}
		} else if (what.equals("changeplan")) {
			if (tpl.getTravelPlanByID(userID, meetingID) != null) {
				ArrayList<Response> list = ri.getAllResponseByPlanID(planID);
				String planID2 = request.getParameter("planID");

				TravelPlan tp2 = new TravelPlan();
				tp2.setUserID(userID);
				tp2.setUsername(request.getParameter("username"));
				tp2.setStartaddress(request.getParameter("startaddress"));
				tp2.setStarttime(request.getParameter("starttime"));
				tp2.setPlanID(planID2);
				tp2.setOveraddress(request.getParameter("overaddress"));
				tp2.setEmail(request.getParameter("email"));
				tp2.setOvertime(request.getParameter("overtime"));
				tp2.setMethod(request.getParameter("method"));
				tp2.setTfnumber(request.getParameter("tfnumber"));
				tp2.setNumber(request.getParameter("number"));
				tp2.setIspublic(request.getParameter("ispublic"));
				String[] str = request.getParameterValues("apisSelected[]");

				String shared = new String();
				if (str != null) {
					for (int i = 0; i < str.length; i++) {
						shared = shared + str[i] + ",";
					}
				}
				tp2.setShared(shared);
				if (list == null) {
					System.out.println("调用");
					tpl.updateTravelPlanAll(tp2);
					request.setAttribute("TravelPlan", tpl.getTravelPlanByID(
							userID, meetingID));
					request
							.getRequestDispatcher(
									"meeting/meetingplan/changesuccess.jsp?changeplan=success")
							.forward(request, response);
				} else {
					System.out.println("调用2");
					se.setAttribute("tp2", tp2);
					request.setAttribute("userID", userID);
					request.getRequestDispatcher(
							"meeting/meetingplan/changePlanLeader2.jsp?what=changeplan&planID="
									+ planID).forward(request, response);
				}
			} else {

				String[] str = request.getParameterValues("apisSelected[]");
				String shared = new String();
				if (str != null) {
					for (int i = 0; i < str.length; i++) {
						shared = shared + str[i] + ",";
					}
				}
				UserImp userImp = new UserImp();
				tpl.addTravelPlan(userID, meetingID, request
						.getParameter("username"), request
						.getParameter("starttime"), request
						.getParameter("overtime"), request
						.getParameter("startaddress"), request
						.getParameter("overaddress"), request
						.getParameter("method"), request
						.getParameter("tfnumber"), userImp.getUserByID(userID)
						.getEmail(), request.getParameter("number"), request
						.getParameter("remark"), shared, request
						.getParameter("ispublic"));
				ri.deleteResponse(meetingID, userID);

				request
						.getRequestDispatcher(
								"meeting/meetingplan/myTravelPlan.jsp?changeplan=success")
						.forward(request, response);
			}
		} else if (what.equals("changeother")) {
			TravelPlan tp = tpl.getTravelPlanByPlanID(planID);
			TravelPlan tp2 = (TravelPlan) se.getAttribute("tp2");
			tpl.addTravelPlan(userID, meetingID, tp2.getUsername(), tp2
					.getStarttime(), tp2.getOvertime(), tp2.getStartaddress(),
					tp2.getOveraddress(), tp2.getMethod(), tp2.getTfnumber(),
					tp2.getEmail(), tp2.getNumber(), tp2.getRemark(), tp2
							.getShared(), tp2.getIspublic());

			String leaderID = request.getParameter("apisSelected[]");
			Response rs = ri.getResponseByID(leaderID, meetingID);
			ri.deleteResponse(meetingID, leaderID);
			tp.setUserID(rs.getUserID());
			tp.setEmail(rs.getEmail());
			tp.setUsername(rs.getUsername());
			tp.setNumber(rs.getNumber());
			ok2 = tpl.updateTravelPlan(tp);
			tpl.updateTravelPlanAll(tp);
			request.getRequestDispatcher(
					"meeting/meetingplan/myTravelPlan.jsp?changeplan=success")
					.forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
