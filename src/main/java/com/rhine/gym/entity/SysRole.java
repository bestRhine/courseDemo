package com.rhine.gym.entity;

public class SysRole{
	private int sysRole_id;
	private String roleName;
	private String tid;
	public int getSysRole_id() {
		return sysRole_id;
	}
	public void setSysRole_id(int sysRole_id) {
		this.sysRole_id = sysRole_id;
	}

	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
}