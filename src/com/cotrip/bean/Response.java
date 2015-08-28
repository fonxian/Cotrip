package com.cotrip.bean;
/**
 * 出行计划响应
 * @author fonxian
 *
 */
public class Response {
	
	private String responseID;
	private String userID;
	private String planID;
	private String email;
	private String username;
	private String number;
	private String remark;
	private String status;
	
	public String getResponseID() {
		return responseID;
	}
	public void setResponseID(String responseID) {
		this.responseID = responseID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPlanID() {
		return planID;
	}
	public void setPlanID(String planID) {
		this.planID = planID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
