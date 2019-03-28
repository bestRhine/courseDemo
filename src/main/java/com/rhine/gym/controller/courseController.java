package com.rhine.gym.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rhine.gym.entity.course;
import com.rhine.gym.service.courseService;
import com.rhine.gym.util.Page;

@Controller

public class courseController{
	
	@Autowired
	private courseService courseService;
	
	@RequestMapping("/findCourse.action")
	public String findCourse(course cs,Model model) {
		List<course> cList=courseService.findCourseByName(cs);
		model.addAttribute("cList",cList);
		return "test";
	}
	
	
	  @RequestMapping("/addCourse")
	public String addCourse(HttpServletRequest request, HttpServletResponse response) {
		 
        course cs=new course();

        String tid = request.getParameter("tid");
        String cname = request.getParameter("cname");
        String cinfo = request.getParameter("cinfo");
        String ctype = request.getParameter("ctype");
        
        cs.setTid(tid);       
        cs.setCname(cname);
        cs.setCinfo(cinfo);
        cs.setCtype(ctype);
 
        courseService.addCourse(cs);
 
        return "redirect:listCourse";
    }
	  
	  @RequestMapping("/deleteCourse")
	    public String deleteCourse(int cid) {
	        courseService.deleteCourse(cid);
	        return "redirect:listCourse";
	    }
	 
	    @RequestMapping("/editCourse")
	    public ModelAndView editCourse(int cid) {
	        ModelAndView mav = new ModelAndView("editCourse");
	        course cs = courseService.getCourse(cid);
	        mav.addObject("course", cs);
	        return mav;
	    }   
	 
	    @RequestMapping("/updateCourse")
	    public String updateCourse(HttpServletRequest request, HttpServletResponse response) {
	 
	        course cs=new course();
	        
	        int cid=Integer.parseInt(request.getParameter("cid"));
	        String tid = request.getParameter("tid");
	        String cname = request.getParameter("cname");
	        String cinfo = request.getParameter("cinfo");
	        String ctype = request.getParameter("ctype");
	        
	        cs.setCid(cid);
	        cs.setTid(tid);       
	        cs.setCname(cname);
	        cs.setCinfo(cinfo);
	        cs.setCtype(ctype);
	        
	        courseService.updateCourse(cs);
	        
	        return "redirect:listCourse";
	    }
	    

	    @RequestMapping("/listCourse")
	    public String listCourse(HttpServletRequest request, HttpServletResponse response) {
	 
	        // 获取分页参数
	        int start = 0;
	        int count = 3;
	 
	        try {
	            start = Integer.parseInt(request.getParameter("page.start"));
	            count = Integer.parseInt(request.getParameter("page.count"));
	        } catch (Exception e) {
	        }
	 

	        Page page = new Page(start, count);
	 
	        List<course> course = courseService.list(page.getStart(), page.getCount());
	        int total = courseService.getTotal();
	        page.setTotal(total);
	 
	        request.setAttribute("course", course);
	        request.setAttribute("page", page);
	 
	        return "listCourse";
	    }

}