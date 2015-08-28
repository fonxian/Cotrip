package com.cotrip.daoimp;

import java.util.ArrayList;
import java.util.List;

import com.cotrip.bean.Meeting;
import com.cotrip.common.SqlHelper;
/**
 * 
 * @author fonxian
 *
 */
public class MeetingImp {
	
	//添加会议
	public boolean addMeeting(Meeting m) {
		boolean res = false;
		String sql = "insert into meeting(managerID,managername,meetinganame,meetingname,website,organization,begintime,endtime,holdcity,holdcountry,brief,content,contactperson,remark,place) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String[] str = { m.getManagerID(), m.getManagername(),
				m.getMeetinganame(), m.getMeetingname(), m.getWebsite(),
				m.getOrganization(), m.getBegintime(), m.getEndtime(),
				m.getHoldcity(), m.getHoldcountry(), m.getBrief(),
				m.getContent(), m.getContactperson(), m.getRemark(),m.getPlace() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}
	
	//修改会议
	public boolean changeMeeting(Meeting m) {
		boolean res = false;
		String sql = "update meeting set meetinganame=?,meetingname=?,website=?,organization=?,begintime=?,endtime=?,holdcity=?,holdcountry=?,brief=?,content=?,contactperson=?,remark=?,place=? where meetingID=?";
		String[] str = { m.getMeetinganame(), m.getMeetingname(),
				m.getWebsite(), m.getOrganization(), m.getBegintime(),
				m.getEndtime(), m.getHoldcity(), m.getHoldcountry(),
				m.getBrief(), m.getContent(), m.getContactperson(),
				m.getRemark(),m.getPlace(), m.getMeetingID() };
		System.out.println("m.getPlace():"+m.getPlace());
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	//获取单个会议
	public static Meeting getMeetingByID(String id) {
		Meeting m = new Meeting();
		String sql = "select * from meeting where meetingID=?";
		String str[] = { id };
		ArrayList<Meeting> al = SqlHelper.executeQuery(Meeting.class, sql, str);
		for (Meeting usr : al) {
			m = usr;
		}
		return m;
	}

	public static Meeting getMeetingByManagerID(String id) {
		Meeting m = new Meeting();
		String sql = "select * from meeting where managerID=?";
		String str[] = { id };
		ArrayList<Meeting> al = SqlHelper.executeQuery(Meeting.class, sql, str);
		for (Meeting usr : al) {
			m = usr;
		}
		return m;
	}
	//获取所有会议
	public static List<Meeting> getAllMeeting(String num, String size,
			String status) {
		String pagenum = Integer.toString((Integer.parseInt(num) - 1)
				* Integer.parseInt(size));
		String pagesize = size;
		String sql = "select * from meeting where status=? order by begintime DESC limit "
				+ pagenum + "," + pagesize;
		String[] str = { status };
		ArrayList<Meeting> meeting = SqlHelper.executeQuery(Meeting.class, sql,
				str);
		return meeting;
	}
	
	//搜索会议
	public static List<Meeting> getAllMeetingFromKey(String status, String key) {
		String sql = "select * from meeting where status=? and (meetinganame like ? or meetingname like ?) order by begintime DESC";
		String[] str = { status, "%" + key + "%", "%" + key + "%" };
		ArrayList<Meeting> meeting = SqlHelper.executeQuery(Meeting.class, sql,
				str);
		return meeting;
	}
	
	//获取会议数量
	public static int getMeetingCountBystatus(String status) {
		String sql = "select * from meeting where status=?";
		String[] str = { status };
		ArrayList<Meeting> meeting = SqlHelper.executeQuery(sql, str);
		return meeting.size();
	}
	
	//修改会议状态
	public static boolean changeMeetingStatus(String meetingID, String status) {
		boolean res = false;
		boolean res2 = false;
		String sql = "update meeting set status=? where meetingID=?";
		String str[] = { status, meetingID };
		res = SqlHelper.executeUpdate(sql, str);
		String managerID = MeetingImp.getMeetingByID(meetingID).getManagerID();
		ManagerImp dao = new ManagerImp();
		if ("O".equals(status)) {
			res2 = dao.changManagerPowerByID(managerID, "O");
		}
		if ("P".equals(status)) {
			res2 = dao.changManagerPowerByID(managerID, "M");
		}
		return res && res2;
	}
	//删除会议
	public static boolean delMeetingByID(String meetingID) {
		ManagerImp manager = new ManagerImp();
		boolean res = false;
		String sql = "delete  from meeting where meetingID=?";
		String str[] = { meetingID };
		String managerID = getMeetingByID(meetingID).getManagerID();
		if (SqlHelper.executeUpdate(sql, str)) {
			res = manager.delManagerByID(managerID);

		}
		return res;
	}

	// 以下为整合的代码
	/**
	 * 分页查询会议
	 * 
	 * @return
	 */
	public ArrayList<Meeting> queryMettings(String key, int page, int pageSize) {
		if (page < 1) {
			return null;
		}
		String sql = "select * from meeting where meetingname like ? and status = 'P' limit "
				+ ((page - 1) * pageSize) + "," + (page * pageSize);
		String[] str = { "%" + key + "%" };
		return SqlHelper.executeQuery(Meeting.class, sql, str);
	}

	public ArrayList<Meeting> queryMettingsById(int id) {
		String sql = "select * from meeting where status = 'P' and meetingID = "
				+ id;
		String[] str = {};
		return SqlHelper.executeQuery(Meeting.class, sql, str);
	}

	public int countMeeting(String key) {
		String sql = "select count(*) from meeting where status = 'P' and meetingname like ?";
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
	public int countMeetingone() {
		String sql = "select count(*) from meeting where status = 'P'";
		ArrayList list = SqlHelper.executeQuery(sql,null);
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

	// 从会议Meeting表中查找出最新审核通过的5个会议
	public ArrayList<Meeting> queryNewMettings() {
		String sql = "select * from meeting where status='P' order by meetingID desc LIMIT 5";
		
		return SqlHelper.executeQuery(Meeting.class, sql, null);
	}
	//显示所有会议
	public ArrayList<Meeting> queryNewAllMeetings() {
		String sql = "select * from meeting where status='P' order by meetingID desc";
		
		return SqlHelper.executeQuery(Meeting.class, sql, null);
	}

}
