package com.rhine.gym.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rhine.gym.entity.Contract;
import com.rhine.gym.entity.ContractCourse;
import com.rhine.gym.entity.ContractItem;
import com.rhine.gym.entity.ContractMember;
import com.rhine.gym.entity.CtMoreInfo;

public interface ContractDao{
	
	void addContract(Contract contract);
	
	List<Contract>  findBy(@Param("params") Map map);
	
	List<CtMoreInfo> showMoreCtInfo(int ctid);
	List<CtMoreInfo> showMoreMemInfo(int ctid);
	
	void  updateContract(@Param("ctid") int ctid,@Param("cname") String cname);    //多个参数使用param进行注解,不然会报param not found
	
	void  contractTransCourse(@Param("params") Map map);
	void  changeTeacher(@Param("ctid") int ctid, @Param("empName") String empName,@Param("type") String type);
	
	void  insertMiddleContractCourse(ContractCourse contractCourse);

	void insertMiddleContractMember(ContractMember contractMember);
	
	int maxCurrentId();

	void insertCtRecord(@Param("ctid")int ctid, @Param("ctoperator")String ctoperator,@Param("ctteacher") String ctteacher,@Param("cname") String cname, @Param("amountuse")int amountuse);

	int getRecordByConditon(@Param("params") Map<String, Object> map);

	
	
}