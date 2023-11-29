package org.studentcrm.crm.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.P_InformationVO;
import org.studentcrm.crm.command.RegisterVO;

@Repository
@Mapper
public interface PaymentService {

	public int pRegister(P_InformationVO vo); 
	public int pModify(P_InformationVO vo); 
	public int pRemove(int p_id); 
	public List<P_InformationVO> getPaymentList(P_InformationVO vo);
}
