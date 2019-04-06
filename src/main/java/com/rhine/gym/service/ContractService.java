package com.rhine.gym.service;

import java.util.List;
import java.util.Map;

import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.CtMoreInfo;

public interface ContractService{
	void addContract(Contract contract);
	List<CtMoreInfo> showMoreInfo(int ctid);
	
	List<Contract>  findBy(Map map);
	void  updateContract(int ctid,String cname);
	void  transContract(Contract contract);    //事务操作
}