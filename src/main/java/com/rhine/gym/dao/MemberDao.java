package com.rhine.gym.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Member;

public interface MemberDao {
	
	List<Member> listByCondition(@Param("params") Map map);
	List<Member> list(int start,int count);
	int getTotal();
	Member listOne(@Param("params") Map map);
}