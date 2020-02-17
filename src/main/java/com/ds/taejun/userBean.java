package com.ds.taejun;

import java.sql.Date;

public class userBean {
	private int idx;
	private String email;
	private String password;
	private String name;
	private Date regist_date;
	
	public userBean(){
		
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	
	public userBean(int idx, String email, String password, String name, Date regist_date) {
		super();
		this.idx = idx;
		this.email = email;
		this.password = password;
		this.name = name;
		this.regist_date = regist_date;
	}
	@Override
	public String toString() {
		return "userBean [idx=" + idx + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", regist_date=" + regist_date + "]";
	}
	
	
	
	
	
}
