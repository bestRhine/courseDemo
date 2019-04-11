package com.rhine.gym.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractCourse;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.ContractMember;
import com.rhine.gym.entity.CtMoreInfo;

public interface ContractDao{
	
	void addContract(Contract contract);
	
	List<Contract>  findBy(@Param("params") Map map);
	
	List<CtMoreInfo> showMoreCtInfo(int ctid);
	List<CtMoreInfo> showMoreMemInfo(int ctid);
	
	void  updateContract(@Param("ctid") int ctid,@Param("cname") String cname);
	
	void  transContract(Contract contract);    //事务操作
	
	void  insertMiddleContractCourse(ContractCourse contractCourse);

	void insertMiddleContractMember(ContractMember contractMember);
	
	int maxCurrentId();
	
}