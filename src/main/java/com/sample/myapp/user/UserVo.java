package com.sample.myapp.user;

import java.sql.Date;

public class UserVo {
	private String userId;
	private String userName;
	private String userBirth;
	private String userPw;
	private String userEmail;
	private String userPhone;

	/* 기본 생성자 */
	public UserVo(){}

	@Override
	public String toString() {
		return "UserVo [userId=" + userId + ", userName=" + userName + ", userBirth=" + userBirth + ", userPw=" + userPw
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + "]";
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
}
