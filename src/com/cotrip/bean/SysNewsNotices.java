package com.cotrip.bean;
/**
 * 系统公告/新闻
 * @author fonxian
 *
 */
public class SysNewsNotices {
	
	
	private String sysnnID;
	private String sysnnname;
	private String sysnntime;
	private String sysnncontent;
	private String type;
	
	
	public String getSysnnID() {
		return sysnnID;
	}
	public void setSysnnID(String sysnnID) {
		this.sysnnID = sysnnID;
	}
	public String getSysnnname() {
		return sysnnname;
	}
	public void setSysnnname(String sysnnname) {
		this.sysnnname = sysnnname;
	}
	public String getSysnntime() {
		return sysnntime;
	}
	public void setSysnntime(String sysnntime) {
		this.sysnntime = sysnntime;
	}
	public String getSysnncontent() {
		return sysnncontent;
	}
	public void setSysnncontent(String sysnncontent) {
		this.sysnncontent = sysnncontent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
