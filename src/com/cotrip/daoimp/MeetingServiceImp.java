package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.MeetingService;
import com.cotrip.common.SqlHelper;

public class MeetingServiceImp {
	
	public boolean addMeetingService(MeetingService ms)
	{
		boolean res=false;
		String sql="insert into meetingservice(meetingID,serviceperson,contactnumber,city,country,remark) values(?,?,?,?,?,?)";
		String[] str={ms.getMeetingID(),ms.getServiceperson(),ms.getContactnumber(),ms.getCity(),ms.getCountry(),ms.getRemark()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean changeMeetingService(MeetingService ms)
	{
		boolean res=false;
		String sql="update meetingservice set serviceperson=?,contactnumber=?,city=?,country=?,remark=? where serviceID=?";
		String[] str={ms.getServiceperson(),ms.getContactnumber(),ms.getCity(),ms.getCountry(),ms.getRemark(),ms.getServiceID()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public static boolean delMeetingServiceByID(String msID)
	{
		boolean res=false;
		String sql="delete from meetingservice where serviceID=?";
		String[] str={msID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public static MeetingService getMeetingServiceByID(String msID)
	{
		String sql="select * from meetingservice where serviceID=?";
		String[] str={msID};
		MeetingService ms=new MeetingService();
		List<MeetingService> list=SqlHelper.executeQuery(MeetingService.class, sql, str);
		for(MeetingService meetingservice:list)
		{
			ms=meetingservice;
		}
		return ms;
	}
	
	public static List<MeetingService> getAllMeetingService(String num,String size,String meetingID)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingservice where meetingID=? order by serviceperson ASC limit "+pagenum+","+pagesize;
		String[] str={meetingID};
		ArrayList<MeetingService> list=SqlHelper.executeQuery(MeetingService.class,sql, str);
		return list;
	}
	
	public static List<MeetingService> getAllMeetingServiceFromKey(String meetingID,String key)
	{
		String sql="select * from meetingservice where meetingID=? and (serviceperson like ? or contactnumber like ?) ";
		String[] str={meetingID, "%" + key + "%", "%" + key + "%"};
		ArrayList<MeetingService> list=SqlHelper.executeQuery(MeetingService.class,sql, str);
		return list;
	}
	
	public static int getMeetingServiceCountByMeetingID(String meetingID)
	{
		String sql="select * from meetingservice where meetingID=?";
		String[] str={meetingID};
		ArrayList<MeetingService> list=SqlHelper.executeQuery(sql, str);
		return list.size();
	}
}
