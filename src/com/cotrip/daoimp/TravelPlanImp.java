package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.Meeting;
import com.cotrip.bean.TravelPlan;
import com.cotrip.bean.User;
import com.cotrip.common.SqlHelper;

public class TravelPlanImp {

	int rowCount=0;//记录
 	int pageCount=0;//有多少页

 	
	public static TravelPlan getTravelPlanByuserIDAndMeetingID(String meetingID,String userID)
	{
		TravelPlan tp=new TravelPlan();
		String sql="select * from travelplan where meetingID=? and userID=?";
		String[] str={meetingID,userID};
		List<TravelPlan> list=SqlHelper.executeQuery(TravelPlan.class, sql, str);
		for(TravelPlan travelplan:list)
		{
			tp=travelplan;
		}
		return tp;
	}
	
	public static TravelPlan getTravelPlanByID(String planID)
	{
		TravelPlan tp=new TravelPlan();
		String sql="select * from travelplan where planID=?";
		String[] str={planID};
		List<TravelPlan> list=SqlHelper.executeQuery(TravelPlan.class, sql, str);
		for(TravelPlan travelplan:list)
		{
			tp=travelplan;
		}
		return tp;
	}
 	//出行计划是否存在
	public static boolean haveTravelPlan(String meetingID,String userID)
	{
		boolean res=false;
		String sql="select * from travelplan where meetingID=? and userID=?";
		String[] str={meetingID,userID};
		List<TravelPlan> list=SqlHelper.executeQuery(TravelPlan.class, sql, str);
		if(list.size()>0)
		{
			res=true;
		}
		return res;
	}
 	//删除出行计划
	public static boolean delTravelPlan(String meetingID,String userID)
	{
		boolean res=false;
		String sql="delete from travelplan where meetingID=? and userID=?";
		String[] str={meetingID,userID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	//以下为整合的代码
	public TravelPlanImp(int pageNow,int pageSize){
 		String sql="select * from TravelPlan";
		String str[]={};
		ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);	
 			rowCount=al.size();	
 		//计算pageCount
 		if(rowCount%pageSize==0){
 			pageCount=rowCount%pageSize; 		
 		}else
 		{
 			pageCount=rowCount/pageSize+1;
 		}
 		
 		if(pageCount==0){
 			pageCount=1;
 		}
 	}
    public TravelPlanImp(){
 		
 	}

 	 public int getpageCount(){
 		return this.pageCount;
 	}
 	 
 	
 	
   public ArrayList<TravelPlan> getMeetingAllTravelPlan(String meetingID,int pageNow,int pageSize){
 		   String sql="select * from TravelPlan where meetingID=? order by starttime desc limit "+(pageNow-1)*pageSize+","+pageSize;
 			String str[]={meetingID};
 			ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
 			return al;
 	   }
 	  
 	//添加出行计划
     public boolean addTravelPlan(String userID,String meetingID,String username,String starttime,String overtime,String startaddress,String overaddress,String method,String tfnumber,String email,String number,String remark,String shared,String ispublic){
    	 String sql="insert into travelplan (planID,userID,meetingID,username,starttime,overtime,startaddress,overaddress,method,tfnumber,email,number,remark,shared,ispublic) values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
  		String[] str={userID,meetingID,username,starttime,overtime,startaddress,overaddress,method,tfnumber,email,number,remark,shared,ispublic};
  		 return SqlHelper.executeUpdate(sql, str);
     }
     
     public TravelPlan getTravelPlanByID(String userID,String meetingID){
    	 String sql="select * from travelplan where userID=? and meetingID=? ";
 		String str[]={userID,meetingID};
 		ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
 		if(al.size()>0){
 			return al.get(0);
 			}
 			else{
 			     return null;	
 			}
     }
     
     public ArrayList<TravelPlan> getMeetingSystemTravelPlan(String meetingID,String startaddress,int pageNow,int pageSize){
    	 System.out.println(startaddress);
    	 String sql="select * from TravelPlan where meetingID=? and startaddress=? limit "+(pageNow-1)*pageSize+","+pageSize;
			String str[]={meetingID,startaddress};
			ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
			if(al.size()>0){
	 			return al;
	 			}
	 			else{
	 			     return null;	
	 			}
     }
  	//删除出行计划
     public boolean deleteTravelPlan(String meetingID,String userID){
    	 String sql="delete from travelplan where meetingID=? and userID=?";
  		 String[] str={meetingID,userID};
  		 return SqlHelper.executeUpdate(sql, str);
     }
     
     public TravelPlan getTravelPlanByPlanID(String planID){
    	 String sql="select * from travelplan where planID=?";
 		String str[]={planID};
 		ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
 		if(al.size()>0){
 			return al.get(0);
 			}
 			else{
 			     return null;	
 			}
     }
     
     public TravelPlan getTravelPlanID(String userID){
  	   String sql="select * from TravelPlan where planID=(select planID from response where userID=?)";
  		String str[]={userID};
  		ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
  		if(al.size()>0){
  		return al.get(0);
  		}
  		else{
  		     return null;	
  		}
     }
 	//更新出行计划
     public boolean updateTravelPlan(TravelPlan tp){
    	 String sql="update TravelPlan set userID=?,email=?,username=?,number=? where planID=?";
   		String str[]={tp.getUserID(),tp.getEmail(),tp.getUsername(),tp.getNumber(),tp.getPlanID()};    	 
    	 return SqlHelper.executeUpdate(sql, str);
     }
    public boolean updateTravelPlanAll(TravelPlan tp){
   	 String sql="update TravelPlan set userID=?,email=?,username=?,number=?,startaddress=?,starttime=?,overtime=?,method=?,tfnumber=?,ispublic=?,shared=? where planID=?";
		String str[]={tp.getUserID(),tp.getEmail(),tp.getUsername(),tp.getNumber(),tp.getStartaddress(),tp.getStarttime(),tp.getOvertime(),tp.getMethod(),tp.getTfnumber(),tp.getIspublic(),tp.getShared(),tp.getPlanID()};    	 
 	 return SqlHelper.executeUpdate(sql, str);
    }
    
    public ArrayList<User> getsharedUser(String planID){
    	String sql="select * from TravelPlan where planID=?";
		String str[]={planID};
		ArrayList<TravelPlan> al = SqlHelper.executeQuery(TravelPlan.class,sql, str);
		String[] IDS=al.get(0).getShared().split(",");	
		ArrayList<User> al2=new ArrayList<User>();
		for(int i=0;i<IDS.length;i++){
			if(IDS[i]!=""){
			String sql2="select * from user where userID=?";
			String str2[]={IDS[i]};
			ArrayList<User> list = SqlHelper.executeQuery(User.class,sql2, str2);
			if(list.size()>0)
				al2.add(list.get(0));
			}
		}
		if(al2.size()>0)
		  return al2;
		else 
		  return null;
    } 
	//查询出行计划
	public ArrayList<TravelPlan> queryByUserId(int userId) {
		String sql = "select * from travelplan where userID = " + userId;
		String[] str = {};
		return SqlHelper.executeQuery(TravelPlan.class, sql, str);
	}
	
	//查询出行计划
	public ArrayList<TravelPlan> queryPlans(String key, int page, int pageSize, String meetingID) {
		if (page < 1) {
			return null;
		}
		String sql = "select * from travelPlan where username like ? and meetingID="+meetingID+" and isPublic = 'Y' limit "
				+ ((page - 1) * pageSize) + "," + (page * pageSize);
		System.out.println("sql:"+sql);
		String[] str = { "%" + key + "%" };
		return SqlHelper.executeQuery(TravelPlan.class, sql, str);
	}
	
	public int countTravelPlan(String key, String meetingID) {
		String sql = "select count(*) from travelPlan where username like ? and meetingID="+meetingID+" and isPublic = 'Y'";
		String[] str = { "%" + key + "%" };
		ArrayList list = SqlHelper.executeQuery(sql, str);
		int num = 0;
		if (!list.isEmpty()) {
			try {
				Object[] o = (Object[]) list.get(0);
				num = Integer.valueOf(o[0].toString());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				num = 0;
			}
		}
		return num;
	}
}
