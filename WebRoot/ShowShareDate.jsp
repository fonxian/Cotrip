<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@ page import="com.cotrip.daoimp.TravelPlanImp"%>
<%@ page import="com.cotrip.daoimp.MeetingImp"%>
<%@ page import="com.cotrip.daoimp.ResponseImp"%>
<%@ page import="com.cotrip.bean.TravelPlan"%>
<%@ page import="com.cotrip.bean.Meeting"%>
<%@ page import="com.cotrip.bean.User"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  
<%
	Object obj = request.getParameter("userID");
	if(obj == null){
	  	RequestDispatcher fr=request.getRequestDispatcher("/organizer/ErrorPage/AddMeetingJoinError.jsp?ErrorInfo=�Ƿ�����ҳ�棡");
  		fr.forward(request, response);
  		return;
	}
  	String userID = (String)obj;
%>
  
<body>
	<div id="div_m">
		<div id="div_main">
			 <div id="div_center">
      <div class="side_title"><h2 align="center">�ҷ����ĳ��мƻ�</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
						<tr>
							<th>��������</th>
							<th>����ʱ��</th>
							<th>����ʱ��</th>
							<th>�����ص�</th>
							<th>����ص�</th>
							<th>���з�ʽ</th>
							<th>����/����</th>
							<th>��ע</th>
							<th>�Ƿ���</th>
							
						</tr>
						<%
							ArrayList<TravelPlan> list = null;
							TravelPlanImp tpi = new TravelPlanImp();
							list = tpi.queryByUserId(new Integer(userID).intValue());
							MeetingImp mi = new MeetingImp();
							if (list.isEmpty()) {
								out.println("<center><h3>�����κγ��мƻ�</h3></center>");
							} else {
									for (int i = 0; i < list.size(); i++) {
									TravelPlan tp = list.get(i);
									ArrayList<Meeting> ms = mi.queryMettingsById(Integer
											.parseInt(tp.getMeetingID()));
									if (ms.isEmpty()) {
										continue;// ���������ڵĻ���
									}
						%>
						<tr>
							<td><a href="meeting?id=<%=ms.get(0).getMeetingID()%>"><%=ms.get(0).getMeetinganame()%></a>
							</td>
							<td><%=tp.getStarttime()%></td>
							<td><%=tp.getOvertime()%></td>
							<td><%=tp.getStartaddress()%></td>
							<td><%=tp.getOveraddress()%></td>
							<td><%=tp.getMethod()%></td>
							<td><%=tp.getTfnumber()%></td>
							<td>${tp.remark }</td>
							<td><%=tp.getIspublic()%></td>
							</tr>
						<%
									}
								}
						%>
					</table>
				</div>
				 <div id="div_center">
      <div class="side_title">
        <h2 align="center">����Ӧ�ĳ��мƻ�</h2>
      </div>
				
					<table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
						<tr>
							<th>��������</th>
							<th>����ʱ��</th>
							<th>����ʱ��</th>
							<th>�����ص�</th>
							<th>����ص�</th>
							<th>���з�ʽ</th>
							<th>����/����</th>
							<th>�Ƿ���</th>
						</tr>
						<%
							ArrayList<TravelPlan> list2 = null;
							ResponseImp ri = new ResponseImp();
							list2 = ri.getTravelPlansByUID(userID);
							if (list2.isEmpty()) {
								out.println("<center><h3>�����κγ��мƻ�</h3></center>");
							} else {
								for (int i = 0; i < list2.size(); i++) {
									TravelPlan tp = list2.get(i);
									ArrayList<Meeting> ms = mi.queryMettingsById(Integer.parseInt(tp.getMeetingID()));
									if (ms.isEmpty()) {
										continue;// ���������ڵĻ���
									}
						%>
						<tr>
							<td><a href="meeting?id=<%=ms.get(0).getMeetingID()%>"><%=ms.get(0).getMeetinganame()%></a>
							</td>
							<td><%=tp.getStarttime()%></td>
							<td><%=tp.getOvertime()%></td>
							<td><%=tp.getStartaddress()%></td>
							<td><%=tp.getOveraddress()%></td>
							<td><%=tp.getMethod()%></td>
							<td><%=tp.getTfnumber()%></td>
							<td><%=tp.getRemark()%></td>
							<td><%=tp.getIspublic()%></td>
						</tr>
						<%
								}
							}
						%>
					</table>
					</div>
			</div>
		</div>
	</div>
	
	</div>
	
</body>
</html>

