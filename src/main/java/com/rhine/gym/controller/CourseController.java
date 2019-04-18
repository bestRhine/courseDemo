package com.rhine.gym.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.rhine.gym.entity.Course;
import com.rhine.gym.service.CourseService;
import com.rhine.gym.util.Page;

@Controller

public class CourseController{
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/findCourse")
		public ModelAndView listCourseByName(ModelAndView mav,String cname) {
		    Map<String,Object> param=new HashMap<String,Object>();
		    param.put("cname","%"+cname+"%");
			List<Course> courseList= courseService.listCourseByName(param);

	        Page page = new Page(0,10);

	        int total = courseList.size(); //取list的size（）得到个数
	        page.setTotal(total);
	     
			mav.addObject("course",courseList);
			mav.addObject("page",page);
			mav.setViewName("listCourse");
			return mav;	
    }

	
	
	  @RequestMapping("/addCourse")
	public String addCourse(HttpServletRequest request, HttpServletResponse response) {
		 
        Course cs=new Course();

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
	   	public ModelAndView editCourse(int cid,String cname) {
	        ModelAndView mav = new ModelAndView("editCourse");
	        mav.addObject("cid",cid);
	        mav.addObject("cname", cname);
	        return mav; 
		}
	 
	    @RequestMapping("/updateCourse")
	    public String updateCourse(HttpServletRequest request, HttpServletResponse response) {
	 
	        Course cs=new Course();
	        
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
	        int count = 7;
	 
	        try {
	            start = Integer.parseInt(request.getParameter("page.start"));
	            count = Integer.parseInt(request.getParameter("page.count"));
	        } catch (Exception e) {
	        }
	 

	        Page page = new Page(start, count); 
	 
	        List<Course> course = courseService.list(page.getStart(), page.getCount());
	        int total = courseService.getTotal();
	        page.setTotal(total);
	 
	        request.setAttribute("course", course);
	        request.setAttribute("page", page);
	 
	        return "listCourse";
	    }

}