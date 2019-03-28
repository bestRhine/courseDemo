package com.rhine.gym.dao;

import java.util.List;

import com.rhine.gym.entity.course;

public interface courseDao {

	/* (non-Javadoc)
	 * @see cn.com.jsf.jsfsystem.dao.impl.TestDao#findCourseByName(cn.com.jsf.jsfsystem.entity.course)
	 */
	List<course> findCourseByName(course cs);
	void deleteCourse(int cid);
	void updateCourse(course cs);
	void addCourse(course cs);
	course getCourse(int cid);

    List<course> list(int start, int count);
	int getTotal();

}