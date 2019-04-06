package com.rhine.gym.entity;

import java.util.Date;

public class Member{
	private int mid;
	private String tid;
	private String mname;
	private String mgender;
	private String mphone;
	private Date mbirthday;
	private String memail;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public Date getMbirthday() {
		return mbirthday;
	}
	public void setMbirthday(Date mbirthday) {
		this.mbirthday = mbirthday;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	
}

