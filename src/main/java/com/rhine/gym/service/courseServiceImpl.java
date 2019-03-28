package com.rhine.gym.service;

import org.springframework.stereotype.Service;

import com.rhine.gym.dao.courseDao;
import com.rhine.gym.entity.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Service

public class courseServiceImpl implements courseService{
	
	@Autowired
	private courseDao courseDao;

	//@Override
	public List<course> findCourseByName(course cs){
		return courseDao.findCourseByName(cs);
	}
	
	 public void addCourse(course cs) {
	        courseDao.addCourse(cs);
	    }
	 
	    public void deleteCourse(int cid) {
	        courseDao.deleteCourse(cid);
	    }
	 
	    public void updateCourse(course cs) {
	        courseDao.updateCourse(cs);
	    }
	    
	    public course getCourse(int cid) {
	    	return courseDao.getCourse(cid);
	    }
	    
	    public List<course> list(int start, int count) {
	        return courseDao.list(start, count);
	    }
	    
	    public int getTotal() {
	        return courseDao.getTotal();
	    }
}