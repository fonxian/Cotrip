<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
   String auther=request.getParameter("auther");
 //  System.out.print(auther);
   TravelPlan tp=(TravelPlan)request.getAttribute("TravelPlan");
   ArrayList<Response> Relist=(ArrayList<Response>)request.getAttribute("Relist");
   ArrayList<User> list=(ArrayList<User>)request.getAttribute("list");
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

  </head>
 <script language="javascript" type="text/javascript">
  function deleteplan(planID){
    if(window.confirm('你确定要删除吗？')){
        //alert("确定");
        window.open("updatePlanServlet?what=deleteplan&planID="+planID,"_self");
     }else{
        //alert("取消");
    }
  }
 function changeplan(){
 	
      window.open("<%=basePath%>meeting/meetingplan/changeplan.jsp","_self");
	
	}
 function changeres(){
 	
		 window.open("<%=basePath%>meeting/meetingplan/changeReponse.jsp","_self");	 
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
      <div class="side_title"><h2 align="center">我的计划</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
      <tbody >
      <%if(tp==null){%>
         <h2>你没有发布计划</h2>
       <%}else{%>
       <tr>
            <td ><div align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</div></td>
            <td ><div align="left"><%=tp.getUsername()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">出发时间:</div></td>
             <td ><div align="left"><%=tp.getStarttime()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">到达时间:</div></td>
             <td ><div align="left"><%=tp.getOvertime()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">出发地点:</div></td>
             <td ><div align="left"><%=tp.getStartaddress()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">到达地点:</div></td>
             <td ><div align="left"><%=tp.getOveraddress()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">方&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;式:</div></td>
             <td ><div align="left"><%=tp.getMethod()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">航&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班:</div></td>
             <td ><div align="left"><%=tp.getTfnumber()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</div></td>
             <td ><div align="left"><%=tp.getEmail()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</div></td>
             <td ><div align="left"><%=tp.getNumber()%></div></td>
           </tr>
           <tr>
             <td ><div align="right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</div></td>
             <td ><div align="left"><%=tp.getRemark()%>&nbsp;</div></td>
           </tr>
           <tr>
             <td ><div align="right">共&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;享:</div></td>
             <td><div align="left">
               <textarea id="remark" name="remark" cols="40" rows="4" ><%if(list!=null){
             for(int i=0,j=0;i<list.size();i++,j++){                 
             %>   
               <%=list.get(i).getEmail()%>,               
               <%}
               }%>
             </textarea>
             </div></td>
           </tr>
           <tr>
             <td ><div align="right">是否公开:</div></td>
             <%if(tp.getIspublic().equals("Y")){%>
             <td ><div align="left">公开</div></td>
             <%}else{%>
             <td ><div align="left">不公开</div></td>
             <%}%>
           </tr>
           <tr>
             <td  align="center" colspan="2"><input type="button" name="删除" value="删除" onClick="deleteplan(<%=tp.getPlanID()%>)" >&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="修改" value="修改" onClick="<%if("yes".equals(auther)){%>changeplan()<%}else{%>changeres()<%} %>"></td>   
           </tr>
       <%}%>     
       </tbody>      
       </table>
       <hr>
       <div class="side_title"><h2 align="center">响应计划用户</h2></div>
       <% if(Relist!=null){%>
    	   <table width="45%" style="padding-left:25px;" border="1">
    	   <tr>
    	   <td>用户名</td>
    	   <td>邮箱</td>
    	   </tr>
    	   <%for(int i=0;i<Relist.size();i++){ %>
		  <tr><%if("yes".equals(auther)){%>
		    <td ><%=Relist.get(i).getUsername()%></td>
		    <td ><%=Relist.get(i).getEmail()%></td>
		       <%}else if("no".equals(auther)){
		           if(Relist.get(i).getStatus().equals("Y")){%>
			    <td ><%=Relist.get(i).getUsername()%></td>
			    <td ><%=Relist.get(i).getEmail()%></td>
			    <%  }
		           } %>
		  </tr>		
       <%}%>
    </table>
      <%}%>   
    </div>        
       </div>
       </div>
       <div id="div_footer"> Co-Trip&copy;2012-2013 </div>  
  </body>
</html>
