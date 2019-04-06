package com.rhine.gym.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Contract{
	
	   private  String    ctid;
	   private String tid;                //租户id
	   private String ctteacher;
	   private String ctsaler;
	   @DateTimeFormat(pattern = "yyyy-MM-dd")  
	   private Date ctbegin;             //起止日期
	   
	   
	   @DateTimeFormat(pattern = "yyyy-MM-dd")
	   private Date ctend;              //datetime
	   private  float  ctorder;           //decimal
	   private float  ctpay;                      //decimal
	   private String ctoperator;          //录入人
	   private String cttype;                     // comment '表示是新办、转让、更换教练',


	public String getCtid() {
		return ctid;
	}
	public void setCtid(String ctid) {
		this.ctid = ctid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCtteacher() {
		return ctteacher;
	}
	public void setCtteacher(String ctteacher) {
		this.ctteacher = ctteacher;
	}
	public String getCtsaler() {
		return ctsaler;
	}
	public void setCtsaler(String ctsaler) {
		this.ctsaler = ctsaler;
	}
	   @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") 
	public Date getCtbegin() {

		   
		return ctbegin;
	}
	public void setCtbegin(Date ctbegin) {
		this.ctbegin = ctbegin;
	}
	   @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")

	public Date getCtend() {
		return ctend;
	}
	public void setCtend(Date ctend) {
		this.ctend = ctend;
	}
	public float getCtorder() {
		return ctorder;
	}
	public void setCtorder(float ctorder) {
		this.ctorder = ctorder;
	}
	public float getCtpay() {
		return ctpay;
	}
	public void setCtpay(float ctpay) {
		this.ctpay = ctpay;
	}
	public String getCtoperator() {
		return ctoperator;
	}
	public void setCtoperator(String ctoperator) {
		this.ctoperator = ctoperator;
	}
	public String getCttype() {
		return cttype;
	}
	public void setCttype(String cttype) {
		this.cttype = cttype;
	}
	
	
	
	
}