package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.MeetingNewsNotices;
import com.cotrip.common.SqlHelper;

public class MeetingNewsNoticesImp {
	//整合的代码
	int rowCount=0;//记录
 	int pageCount=0;//有多少页
 	//整合的代码
	
	public boolean addMeetingNewsNotices(MeetingNewsNotices mnn)
	{
		boolean res=false;
		String sql="insert into meetingnewsnotices(meetingID,mnnname,mnntime,mnncontent,type) values(?,?,?,?,?)";
		String str[]={mnn.getMeetingID(),mnn.getMnnname(),mnn.getMnntime(),mnn.getMnncontent(),mnn.getType()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public boolean changeMeetingNewNoticesByID(MeetingNewsNotices mnn)
	{
		boolean res=false;
		String sql="update meetingnewsnotices set mnnname=?,mnncontent=? where mnnID=?";
		String str[]={mnn.getMnnname(),mnn.getMnncontent(),mnn.getMnnID()};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public static boolean delMeetingNewsNotices(String mnnID)
	{
		boolean res=false;
		String sql="delete from meetingnewsnotices where mnnID=?";
		String str[]={mnnID};
		res=SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	public static List<MeetingNewsNotices> getMeetingNewsNoticesByType(String num,String size,String meetingID,String type)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingnewsnotices where meetingID=? and type=? order by mnntime DESC limit "+pagenum+","+pagesize;
		String[] str={meetingID,type};
		ArrayList<MeetingNewsNotices> mnn=SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
		return mnn;
	}
	
	public static List<MeetingNewsNotices> getMeetingNewsNoticesByTypeFromKey(String meetingID,String type, String key)
	{
		String sql="select * from meetingnewsnotices where meetingID=? and type=? and mnnname like ?  order by mnntime DESC";
		String[] str={meetingID,type,"%" + key + "%"};
		System.out.println("type:"+type);
		System.out.println("meetingID:"+meetingID);
		System.out.println("key:"+key);
		ArrayList<MeetingNewsNotices> mnn=SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
		return mnn;
	}
	
	public static List<MeetingNewsNotices> getMeetingNewsNotices(String num,String size,String meetingID)
	{
		String pagenum=Integer.toString((Integer.parseInt(num)-1)*Integer.parseInt(size));
		String pagesize=size;
		String sql="select * from meetingnewsnotices where meetingID=? order by mnntime DESC limit "+pagenum+","+pagesize;
		String[] str={meetingID};
		ArrayList<MeetingNewsNotices> mnn=SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
		return mnn;
	}
	
	public static int getMeetingNNCountByType(String meetingID,String type)
	{
		String sql="select * from meetingnewsnotices where meetingID=? and type=?";
		String[] str={meetingID,type};
		ArrayList<MeetingNewsNotices> mnn=SqlHelper.executeQuery(sql, str);
		return mnn.size();
	}
	
	public static int getMeetingNNCount(String meetingID)
	{
		String sql="select * from meetingnewsnotices where meetingID=?";
		String[] str={meetingID};
		ArrayList<MeetingNewsNotices> mnn=SqlHelper.executeQuery(sql, str);
		return mnn.size();
	}
	
	public static MeetingNewsNotices getMeetingNewsNoticesByID(String mnnID)
	{
		MeetingNewsNotices mnn=new MeetingNewsNotices();
		String sql="select * from meetingnewsnotices where mnnID=?";
		String[] str={mnnID};
		ArrayList<MeetingNewsNotices> meetingnn=SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
		for(MeetingNewsNotices u: meetingnn)
		{
			mnn=u;
		}
		return mnn;
	}
	//以下为整合的代码
	public MeetingNewsNoticesImp(int pageNow,int pageSize,String type){
 		String sql="select * from meetingnewsnotices where type=?";
		String str[]={type};
		ArrayList<MeetingNewsNotices> al = SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
	
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
 	
 	public MeetingNewsNoticesImp(){
 		
 	}
 	

   
   public ArrayList<MeetingNewsNotices> getMeetingAllNewsNotices(String meetingID,int pageNow,int pageSize,String type){
	   String sql="select * from meetingnewsnotices where meetingID=? and type=? order by mnntime desc limit "+(pageNow-1)*pageSize+","+pageSize;
		String str[]={meetingID,type};
		ArrayList<MeetingNewsNotices> al = SqlHelper.executeQuery(MeetingNewsNotices.class,sql, str);
		return al;
   }
   
   public int getpageCount(){
		return this.pageCount;
	}
}
