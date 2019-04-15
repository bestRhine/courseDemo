package com.rhine.gym.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhine.gym.dao.MemberDao;
import com.rhine.gym.entity.Member;
import com.rhine.gym.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;

    public int getTotal(){
    	 return memberDao.getTotal();
    }
	@Override
	public List<Member> listByCondition(Map map) {
		// TODO Auto-generated method stub
		return memberDao.listByCondition(map);
	}
	@Override
	public List<Member> list(int start, int count) {
		// TODO Auto-generated method stub
		return memberDao.list(start,count);
	}
	@Override
	public Member listOne(Map map) {
		// TODO Auto-generated method stub
		return  memberDao.listOne(map);
	}


	
	
}