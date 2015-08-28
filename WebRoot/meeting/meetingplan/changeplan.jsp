<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="com.cotrip.daoimp.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
   HttpSession se=request.getSession(true);
   Meeting meeting=(Meeting)se.getAttribute("meeting");
   String meetingID=meeting.getMeetingID();
   User user=(User)se.getAttribute("user");
   UserImp ui=new UserImp();
   MeetingImp mi=new MeetingImp();
   TravelPlanImp tpi=new TravelPlanImp();
   if(user==null||meeting==null)
   {
    System.out.print("空");
   }
   TravelPlan tp=tpi.getTravelPlanByID(user.getUserID(),meeting.getMeetingID());
   String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
   int count=MeetingJoinImp.getMeetingJoinCountByMeetingID(meetingID);
    System.out.print(count+meetingID);
     System.out.print("空");
   List<MeetingJoin> list=MeetingJoinImp.getAllMeetingJoin("1", ""+count, meetingID);
   String[] IDS=tp.getShared().split(",");	
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
<script type="text/javascript" src="meeting/js/pwshare.js"></script>
<script type="text/javascript" src="meeting/js/Calendar5.js"></script>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="meeting/css/citySelector.css">
    <style type="text/css">
        .cityinput{
            border-width: 1px;
            border-style: solid;
            border-color: #666 #ccc #ccc #666;
            height: 24px;
            line-height: 24px;
            width: 175px;
            font-size: 12px;
            padding-left: 2px;
            background: url(http://img02.taobaocdn.com/tps/i2/T1EPyLXm0hXXXXXXXX-200-100.png) no-repeat 150px 5px;
            }
            
        .test1 { 
      text-align:justify; 
      text-justify:distribute-all-lines;/*ie6-8*/
      text-align-last:justify;/* ie9*/
      -moz-text-align-last:justify;/*ff*/
      -webkit-text-align-last:justify;/*chrome 20+*/
  } 
  @media screen and (-webkit-min-device-pixel-ratio:0){/* chrome*/
      .test1:after{ 
          content:"."; 
          display: inline-block; 
          width:80%; 
          overflow:hidden; 
          height:0; 
      } 
  } 
    
    </style>
    


<script language="javascript" type="text/javascript">
    var c = new Calendar("c");
    document.write(c);

    //姓名验证
      var nameFlag=false;
	 function checkname(){
		 var name=document.getElementById("username").value;
		 var nameMsg=document.getElementById("nameyan");
		 if(name==""){//用户名是否为空
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 请填写姓名</font>";
		 }
		 else if(name.length<2){//用户名是否小于6为
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 姓名不能小于2位</font>";
		  }
		 else if(name.length>16){//用户名是否大于16为
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 姓名不能大于16位</font>";
		  }
		 else{
		    nameFlag=true;
		    nameMsg.innerHTML="<font color='green'>√</font>";
		 }
		}

	//验证E-mail
	 var emailFlag=false;
	 function checkEmail(){
	  var email=document.getElementById("email").value;
	  var emailMsg=document.getElementById("emailyan");
	  if(email==""){
	     emailFlag=false;
	     emailMsg.innerHTML="<font color='red'>× 请填写电子邮箱</font>";
	  }else if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(email)){ //使用正则表达式验证
	     emailFlag=false;
	     emailMsg.innerHTML="<font color='red'>× 电子邮箱格式不正确</font>";
	  }else{
	     emailFlag=true;
	     emailMsg.innerHTML="<font color='green'>√</font>";
	  }
	 }
     //验证电话
     var numberFlag=false;
	 function checkNumber(){
		 var number=document.getElementById("number").value;
		 var numberMsg=document.getElementById("numberyan");	      
		     if(!(/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/.test(number))){
		    	 numberFlag=false;
		    	 numberMsg.innerHTML="<font color='red'>× 请填写正确电话号码</font>";
		     }else{
		    	 numberFlag=true;
		    	 numberMsg.innerHTML="<font color='green'>√</font>";
		     }
		 }
	 
	 

	 
	 //出发地点验证
	 var startaddressFlag=false;
	 function checkstartaddress(){
		 var startaddress=document.getElementById("startaddress").value;
		 var startaddressMsg=document.getElementById("startaddressyan");
		 if(startaddress==""||startaddress=="城市名"){//出发地点是否为空
			 startaddressFlag=false;
			 startaddressMsg.innerHTML="<font color='red'>× 请填写出发地点</font>";
		 }else{
			 startaddressFlag=true;
			 startaddressMsg.innerHTML="<font color='green'>√</font>";
		 }
		}
	 
	//时间验证
     var timeFlag=false;
	    function checktime(){
	    var	starttime=document.getElementById("starttime").value
	    var	overtime=document.getElementById("overtime").value
	    var starttimeMsg=document.getElementById("starttimeyan");
	    var overtimeMsg=document.getElementById("overtimeyan");
	    
	    var d = new Date();
	    var year = d.getFullYear();
	    var month = d.getMonth() + 1; 
	    var dt = d.getDate();
	    var today = year + "/" + month + "/" + dt;
	    
	    var now= new Date(today.replace(/-/g,"/"));
	    var start= new Date(starttime.replace(/-/g,"/"));
	    var over= new Date(overtime.replace(/-/g,"/")); 
			 if(starttime==""){	  
				 timeFlag=false;
				 starttimeMsg.innerHTML="<font color='red'>× 请填写出发时间</font>";
		     }
			 if(overtime==""){
		    	 timeFlag=false;
		    	 overtimeMsg.innerHTML="<font color='red'>× 请填写到达时间</font>";
		     }
			 if(start<now){
				 timeFlag=false;
				 starttimeMsg.innerHTML="<font color='red'>× 出发时间必须大于当天时间</font>";
			 }else if(start>over){
				 timeFlag=false;
				 starttimeMsg.innerHTML="<font color='red'>× 出发时间不能大于到达时间</font>";
			 }else if(starttime!=""&&overtime!=""){
		    	 timeFlag=true;
		    	 starttimeMsg.innerHTML="<font color='green'>√</font>";
		    	 overtimeMsg.innerHTML="<font color='green'>√</font>";
		     }
	    }
	 
	 
	  //特定共享  
		 var sharedFlag=false;
		 function selected(){
			 var selectedapi = document.getElementById("apisSelected[]");
			 var sharedMsg=document.getElementById("sharedyan");
			 var ispublic=document.getElementById("ispublic").value;
			 
				for(var i=0;i<selectedapi.length;i++){
					selectedapi.options[i].selected = true;
					}
			if(ispublic=="Y"){
					  sharedFlag=true;
					  sharedMsg.innerHTML="<font color='green'>√</font>";		
			}else if(ispublic=="N"){
					  sharedFlag=true;
					  sharedMsg.innerHTML="<font color='green'>√</font>";
				  }	
			  
			}
	
	 	 
	 //验证航班
     var tfnumberflag=false;
	 function checkTFNumber(){
		 var tfnumber=document.getElementById("tfnumber").value;
		 var tfnumberMsg=document.getElementById("tfnumberMsg");	      
		     if(tfnumber.length>15){
		    	 tfnumberflag=false;
		    	 tfnumberMsg.innerHTML="<font color='red'>× 航班信息过长！请输入15字符以内</font>";
		     }else{
		    	 tfnumberflag=true;
		    	 tfnumberMsg.innerHTML="<font color='green'>√</font>";
		     }
		 }
	
	 	 
	 //整体验证
	 function Validation(){
	 	 checkname();
		 selected();
		 checktime();
		 checkstartaddress();
		 checkNumber();
		 checkEmail();
		 checkTFNumber();
		 if(nameFlag&&emailFlag&&numberFlag&&startaddressFlag&&timeFlag&&sharedFlag&&tfnumberflag){
			    return true;
			 }else{
			    alert("您的信息不完整！");
			    return false;
			 }
	}
	 
	 function resetall(){
		 document.getElementById("username").value=""; 
		 document.getElementById("starttime").value=""; 
		 document.getElementById("overtime").value=""; 
		 document.getElementById("startaddress").value="";
		 document.getElementById("email").value="";
		 document.getElementById("number").value="";
		 document.getElementById("remark").value="";
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
      <div class="side_title" align="center"><h2 align="center"><span >修改计划</span></h2></div>
       <form name="form1" method="post" action="<%=path%>/updatePlanServlet?what=changeplan&planID=<%=tp.getPlanID()%>"  onsubmit="return Validation();"  >         
          <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
           <tbody>
           <tr>
             <td width="162" class="test1"><div align="right"><font color='red'>*</font>姓&nbsp;&nbsp;&nbsp;&nbsp;名:</div></td>
             <td width="953" align="left"><input type="text" id="username" name="username" value="<%=tp.getUsername() %>" ><span id="nameyan"></span></td>
           </tr>
           <tr>
             <td class="test1"><div align="right"><font color='red'>*</font>出发时间:</div></td>
             <td align="left"><input type="text" name="starttime" id="starttime" readonly="true" value="<%=tp.getStarttime() %>"/><input name="button" value="&nbsp;*&nbsp;"
                id="button" type="button" onClick="c.showMoreDay = true;c.show(getObjById('starttime'),'<%=date%>',this)" /><span id="starttimeyan"></span></td>
           </tr>
           <tr>
             <td class="test1"><div align="right"><font color='red'>*</font>到达时间:</div></td>
             <td align="left"><input type="text" name="overtime" id="overtime" readonly="true" value="<%=tp.getOvertime() %>"/><input name="button" value="&nbsp;*&nbsp;"
                id="button" type="button" onClick="c.showMoreDay = true;c.show(getObjById('overtime'),'<%=date%>',this)" /><span id="overtimeyan"></span></td>
           </tr>
           <tr>
             <td class="test1"><div align="right"><font color='red'>*</font>出发地点:</div></td>
             <td align="left"><input type="text" class="cityinput" id="startaddress" name="startaddress" value="<%=tp.getStartaddress() %>" /><span id="startaddressyan"></span></td>
           </tr>
           <tr>
             <td class="test1" ><div align="right">到达地点:</div></td>
             <td align="left"><input type="text" id="overaddress" name="overaddress" value="<%=tp.getOveraddress()%>" readonly="true"> </td>
           </tr>
                      <tr>
             <td class="test1"><div align="right">方&nbsp;&nbsp;&nbsp;&nbsp;式:</div></td>
             <td align="left"><select name="method" size="1">
                            <option value="飞机" <%="飞机".equals(tp.getMethod())?"selected":"" %>>飞机</option>
                            <option value="火车" <%="火车".equals(tp.getMethod())?"selected":"" %>>火车</option>
                            <option value="汽车" <%="汽车".equals(tp.getMethod())?"selected":"" %>>汽车</option>
                            <option value="船渡" <%="船渡".equals(tp.getMethod())?"selected":"" %>>船渡</option>
             </select>           </tr>
           <tr>
             <td class="test1"><div align="right">航班/车次:</div></td>
             <td align="left"><input type="text" id="tfnumber" name="tfnumber" value="<%=tp.getTfnumber() %>" ><span id="tfnumberMsg"></span></td>
           </tr>
           <tr>
             <td class="test1"><div align="right"><font color='red'>*</font>邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</div></td>
             <td align="left"><input type="text" id="email" name="email" value="<%=tp.getEmail()%>"  ><span id="emailyan"></span></td>
           </tr>
           <tr>
             <td class="test1"><div align="right"><font color='red'>*</font>电&nbsp;&nbsp;&nbsp;&nbsp;话:</div></td>
             <td align="left"><input type="text" id="number" name="number" value="<%=tp.getNumber()%>"  ><span id="numberyan"></span></td>
           </tr>
           <tr>
             <td class="test1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <div align="right">备&nbsp;&nbsp;&nbsp;&nbsp;注:</div></td>
             <td align="left"><textarea id="remark" name="remark" cols="40" rows="4" value="<%=tp.getRemark() %>"></textarea></td>
           </tr>
           <tr>
             <td class="test1">&nbsp;
              <div align="right">特定共享:</div></td>
             <td align="left" colspan="2">
             <table >
             <td>
				<select name="allApis[]" id="allApis[]" size="10" multiple="multiple" style="width:145px;height:100px;">				
					  <%for(int i=0;i<list.size();i++){
						  if(!list.get(i).getUserID().equals(user.getUserID())){
						  for(int j=0;j<IDS.length;j++){
						  if(!list.get(i).getUserID().equals(IDS[j])){%>
						<option value="<%=list.get(i).getUserID()%>"><%=list.get(i).getUsername()%></option>
						<% 
						  }
						  }
						  }
						  }%>
				</select>			</td>
			<td >
				<input type="button" name="addButton" value="&nbsp;&nbsp;&raquo;&nbsp;&nbsp;"  onclick="move(this.form.elements['allApis[]'], this.form.elements['apisSelected[]']);" /><br />
				<input type="button" name="removeButton" value="&nbsp;&nbsp;&laquo;&nbsp;&nbsp;"  onclick="move(this.form.elements['apisSelected[]'], this.form.elements['allApis[]']);" /><br />			</td>
			<td >
				<select name="apisSelected[]" id="apisSelected[]" size="10" multiple="multiple" style="width:145px;height:100px;">
				 <%for(int i=0;i<list.size();i++){
						  if(!list.get(i).getUserID().equals(user.getUserID())){
						  for(int j=0;j<IDS.length;j++){
						  if(list.get(i).getUserID().equals(IDS[j])){%>
						<option value="<%=list.get(i).getUserID()%>"><%=list.get(i).getUsername()%></option>
						<% 
						  }
						  }
						  }
						  }%>
				</select>
				<td><span id="sharedyan" align="center" valign="middle"></span></td>
			</td>				
			</table>
           </tr>
           <tr>
             <td class="test1">&nbsp;
              <div align="right">是否公开:</div></td>
           <td><div align="left">
             <select id="ispublic" name="ispublic" size=1 onChange="selected()">
               <option value ="N" <%="N".equals(tp.getIspublic())?"selected":"" %>>不公开</option>
               <option value ="Y" <%="Y".equals(tp.getIspublic())?"selected":"" %>>公开</option>      
             </select>
             标记“<font color='red'>*</font>”为必须填写的内容;           </div></td>
           </tr>
           <tr>
          <td colspan="2" align="center"><input type="submit" name="submit" value="提交" />
           &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="reset" value="重置" onClick="resetall()" />           </td>
           </tr>
           </tbody>
           </table>        
       </form>
       </div>
       </div>
       </div>
       <div id="div_footer"> Co-Trip&copy;2012-2013 </div> 
          
<script src="meeting/js/citySelector.js" type="text/javascript"></script>
<script type="text/javascript">
    var test=new Vcity.CitySelector({input:'startaddress'});
</script>    
   
  </body>
</html>
