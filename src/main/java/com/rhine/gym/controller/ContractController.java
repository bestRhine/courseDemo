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
	
	 //按照不同条件组合查询合同
	@RequestMapping("/findBy")
	public String findBy(Model model, Contract contract,String mname,String cname,String ctbegin,String ctend) {
	
		Map<String,Object> map=this.ContracttoMap(contract);
		if(cname!=null&&!cname.equals(""))
		     {map.put("cname","%"+cname+"%");  }
		if(mname!=null&&!mname.equals(""))
	     {map.put("mname","%"+mname+"%");  }
		if(ctbegin!=null&&!ctbegin.equals("")) 
			 {map.put("ctbegin", ctbegin);}
		if(ctend!=null&&!ctend.equals("")) 
			 {map.put("ctend", ctend);}
		if(!(map.get("ctteacher")!=null||map.get("ctid")!=null||map.get("ctcoursetype")!=null||map.containsKey("cname")||
				map.containsKey("mname")||map.containsKey("ctbegin")||map.containsKey("ctend"))) {
			map.put("index", 10);
		}
		List<Contract> contractList=contractService.findBy(map);
		
		model.addAttribute("contract",contract);
		model.addAttribute("ctbegin", ctbegin);
		model.addAttribute("ctend", ctend);
		model.addAttribute("cname",cname);
		model.addAttribute("mname", mname);
		
		model.addAttribute("contractList", contractList.size()<1?null:contractList);
		return "findContract";
	}	
	
	
		
		private Map<String,Object> ContracttoMap(Contract contract){
			Map<String,Object> map =new HashMap<String,Object>();
			
			map.put("ctteacher",checkStringIsEmpty(contract.getCtteacher()));
			map.put("ctid",checkStringIsEmpty(contract.getCtid()));
			map.put("ctcoursetype",checkStringIsEmpty(contract.getCtcoursetype()));
			return map;
		}
		private String checkStringIsEmpty(String param) {
			return param==null?null:(param.equals("")?null:param);  
		}

	 //	展示查到的某合同的具体信息（合同课程信息，会员信息）
	@RequestMapping("/showMoreInfo")
	public  String  showMoreInfo(Model model,int ctid){
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		model.addAttribute("contractList", contractList);
		model.addAttribute("showMoreCtInfoList", showMoreCtInfoList);    //区别modelandview用法
		model.addAttribute("showMoreMemInfoList", showMoreMemInfoList);  
		return "moreCtInfo";
	
	}
	
	// 对某一已上课程进行刷课
	@RequestMapping("/updateContract")
	public  ModelAndView  updateContract(int ctid,String cname){
		contractService.updateContract(ctid,cname);
		ModelAndView mav=new ModelAndView("moreCtInfo");
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", ctid);
		List<Contract> contractList=contractService.findBy(map);
		List<CtMoreInfo> showMoreCtInfoList=contractService.showMoreCtInfo(ctid);  //对更新后数据重新查询
		List<CtMoreInfo> showMoreMemInfoList=contractService.showMoreMemInfo(ctid); //应考虑ajax,局部刷新？
		mav.addObject("contractList", contractList);
		mav.addObject("showMoreCtInfoList", showMoreCtInfoList);                    
		mav.addObject("showMoreMemInfoList", showMoreMemInfoList);
		return mav;
		
	}
	 // 会员间转课
	@RequestMapping("/contractTransCourse")
	public String contractTransCourse(int ctid) {
			
			return "transContract";
	}
	@RequestMapping("/transContract")
	public String transContract(HttpServletRequest request, HttpServletResponse response) {
		
		    String ctid=request.getParameter("ctid");
		    String mname=request.getParameter("mname");
		    String mphone=request.getParameter("mphone");
		    String ctoperator=request.getParameter("ctoperator");
		    Float ctorder=Float.parseFloat(request.getParameter("ctorder"));
		    //String cname=request.getParameter("cname");
		    if(mname==null||mname.equals("")||mphone==null||mphone.equals("")||ctoperator==null||ctoperator.equals("")||ctorder==null||ctorder.equals("")||
		    		ctid==null||ctid.equals("")) {
		    	return "contractTransCourse";
		    }
		    
		    Map<String,Object> map=new HashMap<>();
		    map.put("ctid",ctid);
		    map.put("mname",mname);
		    map.put("mphone",mphone);
		    map.put("ctoperator",ctoperator);
		    map.put("ctorder",ctorder);
		    map.put("cttype","转让");
		   // map.put("cname", cname);
		    contractService.contractTransCourse(map);
			return "findContract";
	}
	

	
	//进入新建合同页面
	@RequestMapping("/editContract")
	public String editContract() {
		return "editContract";
	}
	
	//新建合同，进行信息编辑
	@RequestMapping("/addContract")
	public ModelAndView addContract(Contract contract,String [] courseIdArrays,String [] memberIdArrays,String [] camountArrays) {
		ModelAndView mav=new ModelAndView("findContract");
		if(courseIdArrays.length==0||memberIdArrays.length==0){	    //确保合同信息，会员课程信息已录入 再完成数据库提交，否则关联表为空
			mav.addObject("resultMessage", "对不起，输入信息有误！请添加完成的信息以办理合同!!!");
			return mav;
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
			contractCourse.setCamounttotal(number);
			contractService.insertMiddleContractCourse(contractCourse);			
		}
		for(int i=0;i<memberIdArrays.length;i++) {
			ContractMember contractMember=new ContractMember();
			contractMember.setCtid(currentId);
			contractMember.setMemid(memberIdArrays[i]);
			contractService.insertMiddleContractMember(contractMember);
		}
		mav.addObject("resultMessage", "添加成功！为您生成合同编号为"+currentId);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("ctid", currentId);
		mav.addObject("contractList",contractService.findBy(map));
		return mav;		
	}

	//编辑合同页面，提供课程搜索，不传值搜全部，传值按条件搜索。使用ajax交互
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
    
    // 编辑合同页面，提供会员搜索添加，不传值搜全部，传值按条件搜索。使用ajax交互
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
    
    //查询被数组记录下来的CheckBox选中课程
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
    
    //查询被数组记录下来的CheckBox选中会员
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