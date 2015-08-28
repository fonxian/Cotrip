package com.cotrip.daoimp;

import java.util.ArrayList;

import java.util.List;

import com.cotrip.bean.SysNewsNotices;
import com.cotrip.common.SqlHelper;

public class SysNewsNoticesImp {

	public boolean addSysNewsNotices(SysNewsNotices newsNotices) {
		boolean res = false;
		String sql = "insert into sysnewsnotices(sysnnname,sysnntime,sysnncontent,type) values(?,?,?,?)";
		String str[] = { newsNotices.getSysnnname(),
				newsNotices.getSysnntime(), newsNotices.getSysnncontent(),
				newsNotices.getType() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public boolean changeSysNewNoticesByID(SysNewsNotices newsNotices) {
		boolean res = false;
		String sql = "update sysnewsnotices set sysnnname=?,sysnncontent=? where sysnnID=?";
		String str[] = { newsNotices.getSysnnname(),
				newsNotices.getSysnncontent(), newsNotices.getSysnnID() };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public static boolean delSysNewsNotices(String sysnnID) {
		boolean res = false;
		String sql = "delete from sysnewsnotices where sysnnID=?";
		String str[] = { sysnnID };
		res = SqlHelper.executeUpdate(sql, str);
		return res;
	}

	public static List<SysNewsNotices> getAllNewsNotices(String num,
			String size, String type) {
		String pagenum = Integer.toString((Integer.parseInt(num) - 1)
				* Integer.parseInt(size));
		String pagesize = size;
		String sql = "select * from sysnewsnotices where type=? order by sysnntime DESC limit "
				+ pagenum + "," + pagesize;
		String[] str = { type };
		ArrayList<SysNewsNotices> sysNewsNotices = SqlHelper.executeQuery(
				SysNewsNotices.class, sql, str);
		return sysNewsNotices;
	}

	/**
	 * 搜索
	 * 
	 * @param num
	 * @param size
	 * @param type
	 * @return
	 */
	public static List<SysNewsNotices> getAllNewsNoticesFromKey(String type,
			String key) {
		String sql = "select * from sysnewsnotices where type=? and sysnnname like ? order by sysnntime DESC";
		String[] str = { type, "%" + key + "%" };
		System.out.println("key:" + key);
		ArrayList<SysNewsNotices> sysNewsNotices = SqlHelper.executeQuery(
				SysNewsNotices.class, sql, str);
		return sysNewsNotices;
	}

	public static int getSysNNCountByType(String type) {
		String sql = "select * from sysnewsnotices where type=?";
		String[] str = { type };
		ArrayList<SysNewsNotices> sysNewsNotices = SqlHelper.executeQuery(sql,
				str);
		return sysNewsNotices.size();
	}

	public static SysNewsNotices getNewsNoticesByID(String nnID) {
		SysNewsNotices sysnewsnotices = new SysNewsNotices();
		String sql = "select * from sysnewsnotices where sysnnID=?";
		String[] str = { nnID };
		ArrayList<SysNewsNotices> sysNewsNotices = SqlHelper.executeQuery(
				SysNewsNotices.class, sql, str);
		for (SysNewsNotices u : sysNewsNotices) {
			sysnewsnotices = u;
		}
		return sysnewsnotices;
	}

	// 以下为整合的代码
	/**
	 * 分页查询系统公告、新闻
	 * 
	 * @return
	 */
	public ArrayList<SysNewsNotices> querySysNewsNotices(String type, int page,
			int pageSize) {
		if (page < 1) {
			return null;
		}
		String sql = "select * from sysnewsnotices where type = ? order by sysnntime desc limit "
				+ ((page - 1) * pageSize) + "," + (page * pageSize);
		String[] str = { type };
		return SqlHelper.executeQuery(SysNewsNotices.class, sql, str);
	}

	public ArrayList<SysNewsNotices> querySysNewsNoticesById(String idStr,
			String type) {
		int id = 0;
		try {
			id = Integer.parseInt(idStr.trim());
		} catch (NumberFormatException e) {
			return null;
		}
		String sql = "select * from sysnewsnotices where sysnnID = " + id
				+ " and type = ?";
		String[] str = { type };
		return SqlHelper.executeQuery(SysNewsNotices.class, sql, str);
	}

	public int countNewsNotices(String type) {
		String sql = "select count(*) from sysnewsnotices where type = ?";
		String[] str = { type };
		int num = 0;
		ArrayList list = SqlHelper.executeQuery(sql, str);
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
