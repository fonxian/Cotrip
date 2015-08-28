package com.cotrip.bean;
/**
 * 系统管理员、会议组织者
 * @author fonxian
 *
 */
public class Manager {
	
	
	private String managerID;
	private String managername;
	private String manageremail;
	private String managerpassword;
	private String mobnumber;
	private String power;
	
	
	public String getManagerID() {
		return managerID;
	}
	public void setManagerID(String managerID) {
		this.managerID = managerID;
	}
	public String getManageremail() {
		return manageremail;
	}
	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
	}
	public String getManagerpassword() {
		return managerpassword;
	}
	public void setManagerpassword(String managerpassword) {
		this.managerpassword = managerpassword;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getManagername() {
		return managername;
	}
	public void setMobnumber(String mobnumber) {
		this.mobnumber = mobnumber;
	}
	public String getMobnumber() {
		return mobnumber;
	}

}
