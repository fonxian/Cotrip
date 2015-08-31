package com.cotrip.daoimp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.Response;
import com.cotrip.bean.TravelPlan;
import com.cotrip.common.SqlHelper;
import com.cotrip.databaseFactory.DBFactory;

public class ResponseImp {
	
	public static ArrayList<Response> getAllResponseByPlanID(String planID)
	{
		String sql="select * from response where planID=?";
		String[] str={planID};
		ArrayList<Response> list=SqlHelper.executeQuery(Response.class,sql, str);
		if(list.size()>0)
		{
			return list;
		}
		else{
			return null;
		}
	}
	
	public static ArrayList<Response> getPublicResponseByPlanID(String planID)
	{
		String sql="select * from response where planID=? and status='Y'";
		String[] str={planID};
		ArrayList<Response> list=SqlHelper.executeQuery(Response.class,sql, str);
		return list;
	}
	
	public static boolean haveResponse(String meetingID,String userID)
	{
		boolean res=false;
		String sql="select * from travelplan,response where travelplan.meetingID="+meetingID+" and travelplan.planID=response.planID";
		Connection con=DBFactory.getConnection();
		Statement sta=null;
		ResultSet result=null;
		try {
			sta=con.createStatement();
			result=sta.executeQuery(sql);
			while(result.next())
			{
				if(result.getString(16).equals(userID))
				{
					res=true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return res;
		}finally{
			DBFactory.close(result);
			DBFactory.close(sta);
			DBFactory.close(con);
		}
		return res;
	}
	
	public static String getPlanID(String meetingID,String userID)
	{
		String planID=null;
		String sql="select * from travelplan,response where travelplan.meetingID="+meetingID+" and travelplan.planID=response.planID";
		Connection con=DBFactory.getConnection();
		Statement sta=null;
		ResultSet result=null;
		try {
			sta=con.createStatement();
			result=sta.executeQuery(sql);
			while(result.next())
			{
				if(result.getString(16).equals(userID))
				{
					planID=result.getString(17);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return planID;
		}finally{
			DBFactory.close(result);
			DBFactory.close(sta);
			DBFactory.close(con);
		}
		System.out.println(planID);
		return planID;
	}

	//以下为整合的代码
	public boolean addResponse(String userID,String planID,String email,String username,String number,String remark,String status){
		   String sql="insert into Response (responseID,userID,planID,email,username,number,remark,status) values(null,?,?,?,?,?,?,?)";
	 		String[] str={userID,planID,email,username,number,remark,status};
	 		 return SqlHelper.executeUpdate(sql, str);
	   }
	   
	   public Response getResponseByID(String userID,String meetingID){
		   String sql="select * from Response where userID=?";
	 		String[] str={userID};
	 		String planID=null;
	 		ArrayList<Response> al = SqlHelper.executeQuery(Response.class,sql, str);
	 		for(int i=0;i<al.size();i++){
	  	    	sql="select * from travelplan where planID=? and meetingID=?";
	  	    	String[] str2={al.get(i).getPlanID(),meetingID};
	  	    	ArrayList<TravelPlan> al2 = SqlHelper.executeQuery(TravelPlan.class,sql, str2);
	  	    	if(al2.size()>0){
	  	    	planID=al2.get(0).getPlanID();
	  	    	break;
	  	    	}
	  	      } 	
	 		sql="select * from Response where planID=? and userID=?";
	        String[] str3={planID,userID};
	        al = SqlHelper.executeQuery(Response.class,sql, str3);
	 		if(al.size()>0){
	 			return al.get(0);
	 			}
	 			else{
	 			     return null;	
	 			}
	   }
	   
	   // 从响应表中读取出行计划
	   public ArrayList<TravelPlan> getTravelPlansByUID(String userID){
		   String sql="select * from Response where userID=?";
	 		String[] str={userID};
	 		String planID=null;
	 		ArrayList<Response> al = SqlHelper.executeQuery(Response.class,sql, str);
	 		ArrayList<TravelPlan> als = new ArrayList<TravelPlan>(); 
	 		for(int i=0;i<al.size();i++){
	  	    	sql="select * from travelplan where planID=?";
	  	    	String[] str2={al.get(i).getPlanID()};
	  	    	ArrayList<TravelPlan> al2 = SqlHelper.executeQuery(TravelPlan.class,sql, str2);
	  	    	if(al2.size()>0){
	  	    		als.add(al2.get(0));
	  	    	}
	  	      }
	 		return als;
	   }
	   
	   public boolean deleteResponse(String meetingID,String userID){
		  String sql="select * from Response where userID=?";
		  String[] str={userID};
		  String planID=null;
		  ArrayList<Response> al = SqlHelper.executeQuery(Response.class,sql, str);
	  	      for(int i=0;i<al.size();i++){
	  	    	sql="select * from travelplan where planID=? and meetingID=?";
	  	    	String[] str2={al.get(i).getPlanID(),meetingID};
	  	    	ArrayList<TravelPlan> al2 = SqlHelper.executeQuery(TravelPlan.class,sql, str2);
	  	    	if(al2.size()>0){
	  	    	planID=al2.get(0).getPlanID();
	  	    	break;
	  	    	}
	  	      }
	        sql="delete from Response where planID=? and userID=?";
	        String[] str3={planID,userID};
			return SqlHelper.executeUpdate(sql, str3);
	   }
	   
	   public boolean updateReponseByID(Response rs){
		   String sql="update Response set email=?,username=?,number=?,remark=?,status=? where responseID=?";
	 		String[] str={rs.getEmail(),rs.getUsername(),rs.getNumber(),rs.getRemark(),rs.getStatus(),rs.getResponseID()};
	 		System.out.println("P长："+str.length);
	 		 return SqlHelper.executeUpdate(sql, str);
	   }
	   
}
