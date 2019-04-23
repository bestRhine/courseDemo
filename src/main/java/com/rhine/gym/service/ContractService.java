package com.rhine.gym.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractCourse;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.ContractMember;
import com.rhine.gym.entity.CtMoreInfo;

public interface ContractService{
	void addContract(Contract contract);
	List<CtMoreInfo> showMoreCtInfo(int ctid);
	List<CtMoreInfo> showMoreMemInfo(int ctid);
	
	List<Contract>  findBy(Map map);
	void  updateContract(int ctid,String cname);
	
	void  contractTransCourse(Map map);
	void  changeTeacher(int ctid,String empName, String type);
	
	void insertMiddleContractCourse(ContractCourse contractCourse);
	void insertMiddleContractMember(ContractMember contractMember);
	int maxCurrentId();
	void insertCtRecord(int ctid, String ctoperator, String ctteacher, String cname, int amountuse);
	int getRecordByConditon(Map<String, Object> map);
}