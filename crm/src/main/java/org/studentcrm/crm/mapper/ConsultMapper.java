package org.studentcrm.crm.mapper;

import java.util.List;

import org.studentcrm.crm.command.ConsultVO;
import org.studentcrm.crm.command.Criteria;


public interface ConsultMapper {
   //enter counseling content. 상담 입력
   public boolean insertConsult(ConsultVO vo);
   //show the list of counseling content by the certain period of time and student's id, 상담 내역 기간과 학생 id로 리스트로 보여주기
   public List<ConsultVO> showConsultByDateAndS_id(ConsultVO vo); //
   public List<ConsultVO> showConsultByT_id(int t_id);//show the list of counseling contents by teacher's id, 선생님 id로 상담 내용 보여주기
   public List<ConsultVO> getContent(int s_id);//게시판 상세보기 
   public List<ConsultVO> getStudentList(String s_name);
   //수정 및 삭제
   public boolean updateConsult(ConsultVO vo); // modify student's counseling content. 상담 내용 수정
   public boolean deleteConsult(int consult_id); // delete student's counseling content. 상담 내용 삭제
   
   //페이징 쿼리문 : 매개변수로 Criteria 클래스를 받아서 특정 페이지의 게시글을 출력하는 메서드
   //public List<ConsultVO> pagingList(Criteria cri);
 	
   //전체 게시글 데이터 수
   public int getTotal();

}
