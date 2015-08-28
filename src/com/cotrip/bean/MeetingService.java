package com.cotrip.bean;
/**
 * 会议服务
 * @author root
 *
 */
public class MeetingService {
	
	
	private String serviceID;
	private String meetingID;
	private String serviceperson;	//接待人员
	private String contactnumber;
	private String city;
	private String country;
	private String remark;
	
	
	public String getServiceID() {
		return serviceID;
	}
	public void setServiceID(String serviceID) {
		this.serviceID = serviceID;
	}
	public String getMeetingID() {
		return meetingID;
	}
	public void setMeetingID(String meetingID) {
		this.meetingID = meetingID;
	}
	public String getServiceperson() {
		return serviceperson;
	}
	public void setServiceperson(String serviceperson) {
		this.serviceperson = serviceperson;
	}
	public String getContactnumber() {
		return contactnumber;
	}
	public void setContactnumber(String contactnumber) {
		this.contactnumber = contactnumber;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
