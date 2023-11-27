package org.studentcrm.crm.mapper;

import java.util.List;

import org.studentcrm.crm.command.ConsultVO;

public interface ConsultMapper {
   //상담 입력
   public boolean insertConsult(ConsultVO vo);
   //상담 내역 보여주기
   public List<ConsultVO> showConsultByDateAndS_id(ConsultVO vo); //int s_id, String c_month가 파라미터로 필요
   public List<ConsultVO> showConsultByT_id(int t_id);
   //수정 및 삭제
   public boolean updateConsult(ConsultVO vo);
   public boolean deleteConsult(int consult_id);
   
}
