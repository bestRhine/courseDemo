package com.rhine.gym.entity;

import java.util.List;

public class ContractCourse{
	  private int  ccid;
	  private String ctid;
	  private String tid;
	  private String cid;
	  private int camount;
	  private int camounttotal;

	public int getCamounttotal() {
		return camounttotal;
	}
	public void setCamounttotal(int camounttotal) {
		this.camounttotal = camounttotal;
	}
	public int getCcid() {
		return ccid;
	}
	public void setCcid(int ccid) {
		this.ccid = ccid;
	}
	public String getCtid() {
		return ctid;
	}
	public void setCtid(String string) {
		this.ctid = string;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public int getCamount() {
		return camount;
	}
	public void setCamount(int camount) {
		this.camount = camount;
	}
	  
}