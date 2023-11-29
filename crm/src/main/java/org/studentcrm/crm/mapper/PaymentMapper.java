package org.studentcrm.crm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.P_InformationVO;


@Repository
@Mapper
public interface PaymentMapper {
	//리스트 불러오기
	public List<P_InformationVO> getPaymentList(P_InformationVO vo);
	//추가
	public int insertPayment(P_InformationVO vo);
	//삭제
	public int deletePayment(int p_id);
	//수정
	public int updatePayment(P_InformationVO vo);
}