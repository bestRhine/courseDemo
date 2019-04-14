package com.rhine.gym.service;

import java.util.List;
import java.util.Map;

import com.rhine.gym.entity.Member;

public interface MemberService {

    List<Member> listByCondition(Map map);
    List<Member> list(int start,int count);
	int  getTotal();
	Member listOne(Map map);
}