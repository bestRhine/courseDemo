package com.rhine.gym.service;

import java.util.List;

import com.rhine.gym.entity.course;

public interface courseService {

	List<course> findCourseByName(course cs);
    void addCourse(course cs) ;
    void deleteCourse(int cid);
    void updateCourse(course cs);
    course getCourse(int cid);

    List<course> list(int start, int count);
	int getTotal();

}