<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="com.cotrip.daoimp.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.cotrip.meetingServlet.onlyshared" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<%
    HttpSession se=request.getSession(true);
    String meetingID=(String)se.getAttribute("meetingID");
    String userID=((User)se.getAttribute("user")).getUserID();
  //  System.out.print(userID);
  //   System.out.print("会议"+meetingID);
    String chooice=request.getParameter("chooice");
    int pageSize=5;//一页大小
 	int pageNow=1;//显示第几页
 	
 	//动态接受pageNow
	String spageNow=request.getParameter("spageNow");
    if(spageNow!=null)
    	pageNow=Integer.parseInt(spageNow);
    	
    TravelPlanImp TPI=new TravelPlanImp(pageNow,pageSize); 
    ArrayList<TravelPlan> list;
    if(chooice.equals("system")){
    	UserImp ui=new UserImp();
        list=TPI.getMeetingSystemTravelPlan(meetingID,ui.getUserByID(userID).getCity(),pageNow,pageSize);
    }else{
        list=TPI.getMeetingAllTravelPlan(meetingID,pageNow,pageSize);
    }
    
   
     
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议发布系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<LINK rel=StyleSheet type=text/css href="css/cool.css">
	<link rel=stylesheet type="text/css" href="css/main.css">
	<SCRIPT src="js/menu.js"> </SCRIPT>
	<SCRIPT src="js/easy.js"> </SCRIPT>
	

    <style type="text/css">
<!--
.STYLE4 {font-size: 12px; }
-->
    </style>
</head>
 <script language="javascript" type="text/javascript">
   function takepart(planid,stauts){
	   window.open("<%=basePath%>planServlet?what=createReponse&planid="+planid+"&stauts="+stauts,"_self");
   }
 </script>
 
 
  <body>
   <div id="div_m">
      <jsp:include page="/meeting/meetingMenu.jsp"/>
      <div id="div_main">
  <div id="div_side">
	<%@ include file="side.inc"%>
  </div> 
  <div id="div_center">
        <div class="side_title">
      <h2 align="center"><span ><%if(chooice.equals("onlyshared")){%>
                                                          他人共享
                                            <%}else if(chooice.equals("all")){%>
                                                       所有计划                                
                                           <%}else {%>
                                            系统推荐
                                            			<%}%>   
      </span></h2></div>
      	 <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
  <tr>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">姓 名</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">出发时间</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">到达时间</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">始点</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">终点</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">方式</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">邮箱</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">电话</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">备注</span></td>
    <td align="center" valign="middle" ><span class="STYLE4" style="font-weight:bolder;">加入</span></td>
  </tr>
  
		<% if(list!=null){
		   for(int i=0;i<list.size();i++)
		     {
			   TravelPlan TravelPlan=list.get(i);
			   if(chooice.equals("onlyshared")){
			      onlyshared os=new onlyshared();
			      if(!os.isshared(TravelPlan,userID))
			    	  continue; 
			    }			
			if(TravelPlan.getIspublic().equals("N")){
				onlyshared os=new onlyshared();
				if(!os.isshared(TravelPlan,userID)){
			    	  continue; 		
				}
			}%>
     		<tr>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getUsername()%></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getStarttime() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getOvertime() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getStartaddress()%></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getOveraddress() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getMethod() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getEmail() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getNumber() %></span></td>
     <td align="center" valign="middle" ><span class="STYLE4"><%=TravelPlan.getRemark() %></span></td>
     <%if(TravelPlan.getUserID().equals(userID)){%>     
     <td align="center" valign="middle" >&nbsp;</td>
    <%}else {%> 
      <td align="center" valign="middle" ><input name="ID" type="button" onClick="takepart('<%=TravelPlan.getPlanID()%>','<%=TravelPlan.getIspublic()%>')" value="加入"></td>
    </tr>		
     	<%}
     	 }
		}
     	%>
   </table>
   <hr>
 
      <table align="right">
      <tr align="center">
      <td >
       <% if(pageNow!=1){%>
        <a href=meeting/meetingplan/otherPlanServlet.jsp?spageNow=<%=(pageNow-1)%>&chooice=<%=chooice%> >上一页</a>
       <%}else {%>
           上一页
        <%}%>
        <%for(int i=pageNow;i<=pageNow+4&&i<=TPI.getpageCount();i++){%>
         <a href=meeting/meetingplan/otherPlanServlet.jsp?spageNow=<%=i%>&chooice=<%=chooice%>><%=i%></a>
        <%}%>
        <%if(pageNow!=TPI.getpageCount()){%> 
       	<a href=meeting/meetingplan/otherPlanServlet.jsp?spageNow=<%=(pageNow+1)%>&chooice=<%=chooice%>>下一页</a><br>
       <%}else {%>
           下一页
        <%}%>
       </td>
       </tr>
       <tr>
        <td><form action=meeting/meetingplan/otherPlanServlet.jsp&chooice=<%=chooice%>  method=post >
        <input type=text name=spageNow>
        <input type=submit value=转到>
        </form>
        </td>
        </tr>
      </table>
        </div>
  </div>
  </div>
  <div id="div_footer"> Co-Trip&copy;2012-2013 </div>    
  </body>
</html>
