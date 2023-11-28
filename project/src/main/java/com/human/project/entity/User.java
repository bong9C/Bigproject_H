package com.human.project.entity;

import java.time.LocalDate;

public class User {
	private String custid;
	private String pwd;
	private String uname;
	private String nickname;
	private String email;
	private LocalDate regDate;
	private int isDeleted;
	
	public User() { }
	public User(String custid, String pwd, String uname, String nickname, String email) {
		this.custid = custid;
		this.pwd = pwd;
		this.uname = uname;
		this.nickname = nickname;
		this.email = email;
	}
	public User(String custid, String pwd, String uname, String nickname, String email, LocalDate regDate, int isDeleted) {
		this.custid = custid;
		this.pwd = pwd;
		this.uname = uname;
		this.nickname = nickname;
		this.email = email;
		this.regDate = regDate;
		this.isDeleted = isDeleted;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	@Override
	public String toString() {
		return "User [custid=" + custid + ", pwd=" + pwd + ", uname=" + uname + ", nickname=" + nickname + ", email=" + email
				+ ", regDate=" + regDate + ", isDeleted=" + isDeleted + "]";
	}
	
}
	
	