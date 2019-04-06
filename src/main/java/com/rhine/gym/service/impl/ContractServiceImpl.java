package com.rhine.gym.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhine.gym.dao.ContractDao;
import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.CtMoreInfo;
import com.rhine.gym.service.ContractService;


@Service
public class ContractServiceImpl implements ContractService{
	@Autowired
	private ContractDao contractDao;

	@Override
	public void addContract(Contract contract) {
		// TODO Auto-generated method stub
		contractDao.addContract(contract);
	}

	@Override
	public List<Contract> findBy(Map map) {
		// TODO Auto-generated method stub
		return contractDao.findBy(map);
	}
	
	public List<CtMoreInfo> showMoreInfo(int ctid) {
		return contractDao.showMoreInfo(ctid);
	}
	
	@Override
	public void updateContract(int ctid,String cname) {
		// TODO Auto-generated method stub
		contractDao.updateContract(ctid,cname);
	}

	@Override
	public void transContract(Contract contract) {
		// TODO Auto-generated method stub
		contractDao.transContract(contract);
	}
	
}