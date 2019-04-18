package com.rhine.gym.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Employee;

public interface EmpRoleDao{
	List<Employee> findEmpnamesByRname(@Param("params") Map map);
	
}