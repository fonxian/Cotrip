package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.MeetingJoin;
import com.cotrip.bean.MeetingManager;
import com.cotrip.common.SqlHelper;

public class MeetingManagerImp {
	public boolean addMeetingManager(MeetingManager mm)
	{
		boolean res=false;
		String sql="insert into meetingmanager(meetingID,email,password,name,mobnumber,remark) values(?,?,?,?,?,?)";
		String[] str={mm.getMeetingID(),mm.getEmail(),mm.getPassword(),mm.getName(),mm.getMobnumber(),mm.getRemark()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean changeMeetingManager(MeetingManager mm)
	{
		boolean res=false;
		String sql="update meetingmanager set password=?,mobnumber=?,remark=? where mmanagerID=?";
		String[] str={mm.getPassword(),mm.getMobnumber(),mm.getRemark(),mm.getMmanagerID()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean isMeetingManager(String email,String password)
	{
		boolean res=false;
		String sql="select * from meetingmanager where email=?";
		String[] str={email};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		for(MeetingManager mm:list)
		{
			String oldpassword=mm.getPassword();
			if(oldpassword.equals(password))
			{
				res=true;
			}
		}
		return res;
	}
	
	public static MeetingManager getMeetingManagerByID(String mmID)
	{
		String sql="select * from meetingmanager where mmanagerID=?";
		String[] str={mmID};
		MeetingManager mm=new MeetingManager();
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		for(MeetingManager m:list)
		{
			mm=m;
		}
		return mm;
	}
	
	public  MeetingManager getMeetingManagerByEmail(String email)
	{
		String sql="select * from meetingmanager where email=?";
		String[] str={email};
		MeetingManager mm=new MeetingManager();
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		for(MeetingManager m:list)
		{
			mm=m;
		}
		return mm;
	}
	
	public boolean hasMeetingManager(String email)
	{
		boolean res=false;
		String sql="select * from meetingmanager where email=?";
		String[] str={email};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		for(MeetingManager mm:list)
		{
			String oldemail=mm.getEmail();
			if(oldemail.equals(email))
			{
				res=true;
			}
		}
		return res;
	}
	
	public static List<MeetingManager> getAllMeetingManager(String num,String size,String meetingID)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingmanager where meetingID=? order by name ASC limit "+pagenum+","+pagesize;
		String[] str={meetingID};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		return list;
	}
	
	public static List<MeetingManager> getAllMeetingManagerFromKey(String meetingID,String key)
	{
		String sql="select * from meetingmanager where meetingID=? and (email like ? or name like ?)";
		String[] str={meetingID,"%" + key + "%","%" + key + "%"};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		return list;
	}
	
	public static List<MeetingManager> getMeetingManager(String meetingID)
	{
		String sql="select * from meetingmanager where meetingID=? order by name ASC";
		String[] str={meetingID};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(MeetingManager.class,sql, str);
		return list;
	}
	
	public static int getMeetingManagerCountByMeetingID(String meetingID)
	{
		String sql="select * from meetingmanager where meetingID=?";
		String[] str={meetingID};
		ArrayList<MeetingManager> list=SqlHelper.executeQuery(sql, str);
		return list.size();
	}
	
	public static boolean delMeetingManagerByID(String ID)
	{
		boolean res=false;
		String sql="delete from meetingmanager where mmanagerID=?";
		String str[]={ID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	

}
