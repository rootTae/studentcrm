package org.studentcrm.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.P_InformationVO;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.mapper.GradesMapper;
import org.studentcrm.crm.mapper.PaymentMapper;
import org.studentcrm.crm.mapper.RegisterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class PaymentServiceImple implements PaymentService {

	@Setter(onMethod_ = {@Autowired})
	private PaymentMapper mapper;
	
	@Override
	public List<P_InformationVO> getPaymentList(P_InformationVO vo) {
		return mapper.getPaymentList(vo);
	}

	@Override
	public int pRegister(P_InformationVO vo) {
		return mapper.insertPayment(vo);
	}
	
	@Override
	public int pModify(P_InformationVO vo) {
		return mapper.updatePayment(vo);
	}
	
	@Override
	public int pRemove(int p_id) {
		return mapper.deletePayment(p_id);
	}

}
