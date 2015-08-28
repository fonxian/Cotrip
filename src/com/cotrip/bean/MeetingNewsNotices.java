package com.cotrip.bean;
/**
 * 会议新闻公告实体
 * @author fonxian
 *
 */
public class MeetingNewsNotices {
	private String mnnID;
	private String meetingID;
	private String mnnname;
	private String mnntime;
	private String mnncontent;
	private String type;
	public String getMnnID() {
		return mnnID;
	}
	public void setMnnID(String mnnID) {
		this.mnnID = mnnID;
	}
	public String getMeetingID() {
		return meetingID;
	}
	public void setMeetingID(String meetingID) {
		this.meetingID = meetingID;
	}
	public String getMnnname() {
		return mnnname;
	}
	public void setMnnname(String mnnname) {
		this.mnnname = mnnname;
	}
	public String getMnntime() {
		return mnntime;
	}
	public void setMnntime(String mnntime) {
		this.mnntime = mnntime;
	}
	public String getMnncontent() {
		return mnncontent;
	}
	public void setMnncontent(String mnncontent) {
		this.mnncontent = mnncontent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

}
