package com.rhine.gym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractCourse;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.ContractMember;
import com.rhine.gym.entity.CtMoreInfo;
import com.rhine.gym.service.ContractService;

@Controller
public class ContractController{
	@Autowired
	private ContractService contractService;
	
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

		List<CtMoreInfo> ctMoreInfoList=contractService.showMoreInfo(ctid);
		model.addAttribute("ctMoreInfoList", ctMoreInfoList);    //区别modelandview用法
		return "moreCtInfo";
	
	}
	
	@RequestMapping("/updateContract")
	public  ModelAndView  updateContract(int ctid,String cname){
		contractService.updateContract(ctid,cname);
		ModelAndView mav=new ModelAndView("moreCtInfo");
		List<CtMoreInfo> ctMoreInfoList=contractService.showMoreInfo(ctid);  //对更新后数据重新查询
		mav.addObject("ctMoreInfoList", ctMoreInfoList);                     //应考虑ajax,局部刷新？
		return mav;
		
	}
	
	@RequestMapping("/addContract")
	public String addContract(HttpServletRequest request, HttpServletResponse response) {
		Contract contract=new Contract();
		ContractCourse contractCourse=new ContractCourse();
		ContractMember contractMember=new ContractMember();
		
		
		return null;
		
	}

}