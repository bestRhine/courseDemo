package com.rhine.gym.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhine.gym.dao.EmpRoleDao;
import com.rhine.gym.entity.Employee;
import com.rhine.gym.service.EmpRoleService;

@Service
public class EmpRoleServiceImpl implements EmpRoleService{
	
	@Autowired
	private EmpRoleDao empRoleDao;
	
	@Override
	public List<Employee> findEmpnamesByRname(Map map) {
		// TODO Auto-generated method stub
		return empRoleDao.findEmpnamesByRname(map);
	}
	
}