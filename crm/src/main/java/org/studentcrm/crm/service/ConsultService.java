package org.studentcrm.crm.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ConsultVO;
import org.studentcrm.crm.command.Criteria;

@Repository
@Mapper
public interface ConsultService {
   //상담 입력
      public boolean insertConsult(ConsultVO vo);
      //상담 내역 보여주기
      public List<ConsultVO> showConsultByDateAndS_id(ConsultVO vo); //int s_id, String c_month가 파라미터로 필요
      public List<ConsultVO> showConsultByT_id(int t_id);
      public List<ConsultVO> getStudentList(String s_name);
      public List<ConsultVO> getContent(int consult_id);
      //수정 및 삭제
      public boolean updateConsult(ConsultVO vo);
      public boolean deleteConsult(int consult_id);
      
      //페이징 처리 
		/*
		 * public List<ConsultVO> showConsultByDateAndS_id(Criteria cri); //int s_id,
		 * String c_month가 파라미터로 필요 public List<ConsultVO> showConsultByT_id(Criteria
		 * cri); //페이징 처리된 게시글 public int public int getTotal(); //전체 게시글 수
		 */   
}