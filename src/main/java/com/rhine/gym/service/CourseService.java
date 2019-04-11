package com.rhine.gym.service;

import java.util.List;
import java.util.Map;

import com.rhine.gym.entity.Course;

public interface CourseService {

	List<Course> listCourseByName(Map<String,Object> map);
    void addCourse(Course cs) ;
    void deleteCourse(int cid);
    void updateCourse(Course cs);
    Course getCourse(int cid);

    List<Course> list(int start, int count);
	int getTotal();

}