package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.MeetingJoin;
import com.cotrip.bean.Response;
import com.cotrip.bean.TravelPlan;
import com.cotrip.common.SqlHelper;

public class MeetingJoinImp {
	
	//判断参会人员是否已经加入该会议
	public static boolean haveMeetingJoin(String meetingId , String userId){
		String sql = "select * from meetingjoin where meetingID = ? and userID = ?";
		String[] str = {meetingId,userId};
		ArrayList<MeetingJoin> join = SqlHelper.executeQuery(MeetingJoin.class,sql, str);
		if(join == null || join.size() == 0)
			return false;
		else return true;
	}
	
	public boolean addMeetingJoin(MeetingJoin mjoin)
	{
		boolean res=false;
		String sql="insert into meetingjoin(meetingID,meetingname,userID,username) values(?,?,?,?)";
		String[] str={mjoin.getMeetingID(),mjoin.getMeetingname(),mjoin.getUserID(),mjoin.getUsername()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public static boolean haveManagerID(String mmID)
	{
		boolean res=false;
		String sql="select * from meetingjoin where mmanagerID=?";
		String[] str={mmID};
		ArrayList<MeetingJoin> meeting=SqlHelper.executeQuery(sql, str);
		if(meeting.size()>0)
		{
			res=true;
		}
		return res;
	}
	//获取参会列表
	public static List<MeetingJoin> getAllMeetingJoin(String num,String size,String meetingID)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingjoin where meetingID=? order by username ASC limit "+pagenum+","+pagesize;
		String[] str={meetingID};
		ArrayList<MeetingJoin> list=SqlHelper.executeQuery(MeetingJoin.class,sql, str);
		return list;
	}
	//通过关键字查询参会信息
	public static List<MeetingJoin> getAllMeetingJoinFromKey(String meetingID,String key)
	{
		String sql="select * from meetingjoin where meetingID=? and username like ? ";
		String[] str={meetingID,"%" + key + "%"};
		ArrayList<MeetingJoin> list=SqlHelper.executeQuery(MeetingJoin.class,sql, str);
		return list;
	}
	
	public static List<MeetingJoin> getMeetingJoinByManagerID(String mmID,String num,String size)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingjoin where mmanagerID=? order by username ASC limit "+pagenum+","+pagesize;
		String[] str={mmID};
		ArrayList<MeetingJoin> list=SqlHelper.executeQuery(MeetingJoin.class,sql, str);
		return list;
	}
	
	public static List<MeetingJoin> getMeetingJoinByManagerIDFromKey(String mmID,String key)
	{
		String sql="select * from meetingjoin where mmanagerID=? and username like ?";
		String[] str={mmID, "%" + key + "%"};
		ArrayList<MeetingJoin> list=SqlHelper.executeQuery(MeetingJoin.class,sql, str);
		return list;
	}
	
	public static int getMeetingJoinCountByMeetingID(String meetingID)
	{
		String sql="select * from meetingjoin where meetingID=?";
		String[] str={meetingID};
		ArrayList<MeetingJoin> meeting=SqlHelper.executeQuery(sql, str);
		System.out.println("会议ID"+meetingID);
		return meeting.size();
	}
	
	public static boolean delMeetingJoinByID(String joinID)
	{
		boolean res=false;
		boolean res2=false;
		String sql="delete from meetingjoin where joinID=?";
		String str[]={joinID};
		MeetingJoin mj=MeetingJoinImp.getMeetingJoinByID(joinID);
		res2=TravelPlanImp.delTravelPlan(mj.getMeetingID(), mj.getUserID());
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean setServer(String meetingID,String userID,String managerID,String name)
	{
		boolean res=false;
		String sql="update meetingjoin set mmanagerID=?,name=? where meetingID=? and userID=?";
		String[] str={managerID,name,meetingID,userID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean setServerByGroup(String meetingID,String userID,String managerID,String name)
	{
		boolean res=true;
		MeetingJoinImp mjdao=new MeetingJoinImp();
		TravelPlanImp tpdao=new TravelPlanImp();
		ResponseImp rdao=new ResponseImp();
		if(!mjdao.setServer(meetingID, userID, managerID,name))
		{
			res=false;
		}
		if(tpdao.haveTravelPlan(meetingID,userID))
		{
			TravelPlan tp=tpdao.getTravelPlanByuserIDAndMeetingID(meetingID,userID);
			if(!mjdao.setServer(meetingID, tp.getUserID(), managerID,name))
			{
				res=false;
			}
			List<Response> list=ResponseImp.getAllResponseByPlanID(tp.getPlanID());
			for(Response response:list)
			{
				if(!mjdao.setServer(meetingID, response.getUserID(), managerID,name))
				{
					res=false;
				}
			}
		}else if(rdao.haveResponse(meetingID,userID))
		{
			String planID=rdao.getPlanID(meetingID,userID);
			TravelPlan tp=tpdao.getTravelPlanByID(planID);
			if(!mjdao.setServer(meetingID, tp.getUserID(), managerID,name))
			{
				res=false;
			}
			List<Response> list=ResponseImp.getAllResponseByPlanID(tp.getPlanID());
			for(Response response:list)
			{
				if(!mjdao.setServer(meetingID, response.getUserID(), managerID,name))
				{
					res=false;
				}
			}
		}
		
		return res;
	}
	
	public static MeetingJoin getMeetingJoinByID(String joinID){
	   	 String sql="select * from meetingjoin where joinID=?";
			String str[]={joinID};
			ArrayList<MeetingJoin> al = SqlHelper.executeQuery(MeetingJoin.class,sql, str);
			if(al.size()>0){
				return al.get(0);
			}
			return null;
	    }
	//以下为整合的代码
	public MeetingJoin getMeetingJoin(String meetingID,String userID){
	   	 String sql="select * from meetingjoin where meetingID=? and userID=?";
			String str[]={meetingID, userID};
			ArrayList<MeetingJoin> al = SqlHelper.executeQuery(MeetingJoin.class,sql, str);
			if(al.size()>0){
				return al.get(0);
			}
			return null;
	    }
	    //添加参会信息
	    public boolean addMeetingJoin(String meetingID,String userID,String meetingname,String username){
	   	String sql="insert into MeetingJoin (joinID,meetingID,mmanagerID,userID,meetingname,username,name) values(null,?,null,?,?,?,null)";
			String[] str={meetingID,userID,meetingname,username};
			 return SqlHelper.executeUpdate(sql, str);
	    }
	    //删除参会信息
	    public boolean deleteMeetingJoin(String meetingID,String userID){
	   	 String sql="delete from meetingjoin where meetingID=? and userID=?";
	 		String[] str={meetingID,userID};
	 		 return SqlHelper.executeUpdate(sql, str);
	    }

		public ArrayList<MeetingJoin> queryByUserName(String username) {
			String sql = "select * from meetingjoin where username = ?";
			String[] str = { username };
			return SqlHelper.executeQuery(MeetingJoin.class, sql, str);
		}

}
