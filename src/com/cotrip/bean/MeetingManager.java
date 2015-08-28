package com.cotrip.bean;
/**
 * 会议接待人员
 * @author fonxian
 *
 */
public class MeetingManager {
	
	private String mmanagerID;
	private String meetingID;
	private String email;
	private String password;
	private String name;
	private String mobnumber;
	private String remark;
	
	public String getMmanagerID() {
		return mmanagerID;
	}
	public void setMmanagerID(String mmanagerID) {
		this.mmanagerID = mmanagerID;
	}
	public String getMeetingID() {
		return meetingID;
	}
	public void setMeetingID(String meetingID) {
		this.meetingID = meetingID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobnumber() {
		return mobnumber;
	}
	public void setMobnumber(String mobnumber) {
		this.mobnumber = mobnumber;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
