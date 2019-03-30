package com.rhine.gym.service;

import java.util.List;

import com.rhine.gym.entity.Course;

public interface CourseService {

	List<Course> listCourseByName(String cname);
    void addCourse(Course cs) ;
    void deleteCourse(int cid);
    void updateCourse(Course cs);
    Course getCourse(int cid);

    List<Course> list(int start, int count);
	int getTotal();

}