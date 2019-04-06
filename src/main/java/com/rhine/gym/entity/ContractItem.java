package com.rhine.gym.entity;

import java.util.Date;
import java.util.List;

public class ContractItem{
	private int ctid;
	private String tid;
	private String ctteacher;
	private String ctsaler;
	private Date ctbegin;
	private Date ctend;
	private float ctorder;
	private float ctpay;
	private  float ctoperator;	
	private String cttype;

	
	private int camount;
	private String cname;
	private String ctype;
	
	private List<ContractCourse>  contractCourses;
	
	
	public List<ContractCourse> getContractCourses() {
		return contractCourses;
	}
	public void setContractCourses(List<ContractCourse> contractCourses) {
		this.contractCourses = contractCourses;
	}
	public String getCtsaler() {
		return ctsaler;
	}
	public void setCtsaler(String ctsaler) {
		this.ctsaler = ctsaler;
	}
	public Date getCtbegin() {
		return ctbegin;
	}
	public void setCtbegin(Date ctbegin) {
		this.ctbegin = ctbegin;
	}
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
	public float getCtoperator() {
		return ctoperator;
	}
	public void setCtoperator(float ctoperator) {
		this.ctoperator = ctoperator;
	}
	public String getCttype() {
		return cttype;
	}
	public void setCttype(String cttype) {
		this.cttype = cttype;
	}
	public void setCtteacher(String ctteacher) {
		this.ctteacher = ctteacher;
	}
	public int getCtid() {
		return ctid;
	}
	public void setCtid(int ctid) {
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
	public void setTctteacher(String ctteacher) {
		this.ctteacher = ctteacher;
	}

	public int getCamount() {
		return camount;
	}
	public void setCamount(int camount) {
		this.camount = camount;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	
	
	
}