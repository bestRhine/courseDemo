package com.rhine.gym.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractCourse;
import com.rhine.gym.entity.ContractMember;
import com.rhine.gym.entity.Course;
import com.rhine.gym.entity.CtMoreInfo;
import com.rhine.gym.entity.Member;
import com.rhine.gym.service.ContractService;
import com.rhine.gym.service.CourseService;
import com.rhine.gym.service.MemberService;

@Controller
public class ContractController{
	@Autowired
	private ContractService contractService;
	
	@Resource
	CourseService courseService;
	
	@Resource
	MemberService memberService;
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/findBy")
	public String findBy(Model model, Contract contract,String ctbegin,String ctend) {
	
		Map<String,Object> map=this.ContracttoMap(contract);
		if(ctbegin!=null&&!ctbegin.equals("")) {map.put("ctbegin", ctbegin);}
		if(ctend!=null&&!ctend.equals("")) {map.put("ctend", ctend);}
		List<Contract> contractList=contractService.findBy(map);
		
		model.addAttribute("contract",contract);
		model.addAttribute("ctbegin", ctbegin);
		model.addAttribute("ctend", ctend);
		
		model.addAttribute("contractList", contractList.size()<1?null:contractList);

		return "findContract";
	}	
	
	
		
		private Map<String,Object> ContracttoMap(Contract contract){
			Map<String,Object> map =new HashMap<String,Object>();
			
			map.put("ctteacher",checkStringIsEmpty(contract.getCtteacher()));
			map.put("ctid",checkStringIsEmpty(contract.getCtid()));
			return map;
		}
		private String checkStringIsEmpty(String param) {
			return param==null?null:(param.equals("")?null:param);  
		}

		
	@RequestMapping("/showMoreInfo")
	public  String  showMoreInfo(Model model,int ctid){

		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid);
		model.addAttribute("showMoreCtInfoList", showMoreCtInfoList);    //区别modelandview用法
		model.addAttribute("showMoreMemInfoList", showMoreMemInfoList);  
		return "moreCtInfo";
	
	}
	
	@RequestMapping("/updateContract")
	public  ModelAndView  updateContract(int ctid,String cname){
		contractService.updateContract(ctid,cname);
		ModelAndView mav=new ModelAndView("moreCtInfo");
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);  //对更新后数据重新查询
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid);
		mav.addObject("showMoreCtInfoList", showMoreCtInfoList);                     //应考虑ajax,局部刷新？
		mav.addObject("showMoreMemInfoList", showMoreMemInfoList);
		return mav;
		
	}
	
	@RequestMapping("/transContract")
	public String transContract(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "transContract";
		
	}
	
	@RequestMapping("/editContract")
	public String editContract() {
		return "editContract";
	}

	@RequestMapping("/addContract")
	public String addContract(Model model,Contract contract,String [] courseIdArrays,String [] memberIdArrays,String [] camountArrays) {
		
		if(courseIdArrays.length==0||memberIdArrays.length==0){	    //确保合同信息，会员课程信息已录入 再完成数据库提交，否则关联表为空
			model.addAttribute("resultMessage", "请添加完成的信息以办理合同");
			return "editContract";
		}
		contractService.addContract(contract);                      
		int currentIdTemp=contractService.maxCurrentId();
		String currentId=String.valueOf(currentIdTemp);
		for(int i=0;i<courseIdArrays.length;i++) {
			ContractCourse contractCourse=new ContractCourse();
			int number=Integer.parseInt(camountArrays[i].equals("")?"0":camountArrays[i]);
			contractCourse.setCamount(number);
			contractCourse.setCtid(currentId);
			contractCourse.setCid(courseIdArrays[i]);
			contractCourse.setTid(contract.getTid());
			contractService.insertMiddleContractCourse(contractCourse);			
		}
		for(int i=0;i<memberIdArrays.length;i++) {
			ContractMember contractMember=new ContractMember();
			contractMember.setCtid(currentId);
			contractMember.setMemid(memberIdArrays[i]);
			contractService.insertMiddleContractMember(contractMember);
		}
		model.addAttribute("resultMessage", "添加成功！为您生成合同编号为"+currentId);
		return "findContract";		
	}


    @RequestMapping("/getCourseList")
    public  @ResponseBody List<Course> getCourseList(@RequestBody String json){
		Map<String,Object> param=new HashMap<String,Object>();
		List<Course> courseList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String cname=JSONObject.parseObject(json).getString("cname");
			if(!StringUtils.isNullOrEmpty(cname)) {
				param.put("cname", "%"+cname+"%");
				courseList=courseService.listCourseByName(param);
			}
			else {
				 int total = courseService.getTotal();
				 courseList=courseService.list(0, total);
			}
		}
    	//List<Course> courseList=courseService.listCourseByName(param);
    	return courseList;
    	
    }
    
    
    @RequestMapping("/getMemberList")
    public  @ResponseBody List<Member> getMemberList(@RequestBody String json){
		Map<String,Object> param=new HashMap<String,Object>();
		List<Member> memberList=null;
		if(!StringUtils.isNullOrEmpty(json)) {
			String mname=JSONObject.parseObject(json).getString("mname");
			if(!StringUtils.isNullOrEmpty(mname)) {
				param.put("mname", "%"+mname+"%");
				memberList=memberService.listByCondition(param);
			}else {
				int total = memberService.getTotal();
				 memberList=memberService.list(0, total);
			}
			
		}
		// memberList=memberService.listByCondition(param);	
		 return memberList;
    }
    
    @RequestMapping("/getCourseAndAmountList")
    public  @ResponseBody List<Map<String, Object>> getCourseAndAmountList(String [] arrays){
    	List<Map<String,Object>> courseList=new ArrayList<Map<String,Object>>();
		Map<String,Object> cMap=null;
		for(int i=0;i<arrays.length;i++) {
			cMap=new HashMap<String,Object>();
			String cid=arrays[i];

			Map<String,Object> param=new HashMap<>();
			param.put("cid",cid);
			cMap.put("course",courseService.listCourseByName(param));
			courseList.add(cMap);
		}
		return courseList;
    }
    
    @RequestMapping("/getMemberJsonList")
    public  @ResponseBody List<Map<String, Object>> getMemberJsonList(String [] arrays){
		
		List<Map<String,Object>> memberList=new ArrayList<Map<String,Object>>();
		Map<String,Object> mMap=null;
		for(int i=0;i<arrays.length;i++) {
			mMap=new HashMap<String,Object>();
			String mid=arrays[i];

			Map<String,Object> param=new HashMap<>();
			param.put("mid",mid);
			mMap.put("member",memberService.listByCondition(param));
			memberList.add(mMap);
		}
		return memberList;
    }
    
}