package com.cotrip.bean;
/**
 * 注册用户
 * @author fonxian
 *
 */
public class User {
	
	private String userID;
	private String username;
	private String password;
	private String email;
	private String age;
	private String sex;
	private String country;
	private String city;
	private String title;
	private String education;
	private String company;
	private String mobnumber;
	private String telnumber;
	private String address;
	private String postcode;
	private String registtime;
	private String status;
	private String random_code;

	// 注册后生成的随机码，如果为空字符串，表示账号正常，如果账号处理未激活状态，那么随机码是标志位1 + UUID
	// 如果账号是处于重设密码状态，随机码是标志位2+UUID。

	public String getRandom_code() {
		return random_code;
	}

	public void setRandom_code(String random_code) {
		this.random_code = random_code;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMobnumber() {
		return mobnumber;
	}

	public void setMobnumber(String mobnumber) {
		this.mobnumber = mobnumber;
	}

	public String getTelnumber() {
		return telnumber;
	}

	public void setTelnumber(String telnumber) {
		this.telnumber = telnumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRegisttime() {
		return registtime;
	}

	public void setRegisttime(String registtime) {
		this.registtime = registtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
