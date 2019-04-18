package com.rhine.gym.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Employee;

public interface EmpRoleService{
	
	List<Employee> findEmpnamesByRname(Map map);
}