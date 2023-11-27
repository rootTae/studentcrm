package org.studentcrm.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.ConsultVO;
import org.studentcrm.crm.command.Criteria;
import org.studentcrm.crm.mapper.ConsultMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ConsultServiceImpl implements ConsultService {

   @Autowired
   ConsultMapper mapper;
   
   //추가 수정 삭제
   @Override
   public boolean insertConsult(ConsultVO vo) {      
      return mapper.insertConsult(vo);
   }

   @Override
   public boolean updateConsult(ConsultVO vo) {
      return mapper.updateConsult(vo);
   }

   @Override
   public boolean deleteConsult(int consult_id) {
      return mapper.deleteConsult(consult_id);
   }
   
   //츌력
   @Override
   public List<ConsultVO> showConsultByDateAndS_id(ConsultVO vo) {
      return mapper.showConsultByDateAndS_id(vo);
   }

   @Override
   public List<ConsultVO> showConsultByT_id(int t_id) {
      return mapper.showConsultByT_id(t_id);
   }

   /*
    * //페이징
    * 
    * @Override public List<ConsultVO> getList(Criteria cri) { return mapper.get; }
    * 
    * @Override public int getTotal() { // TODO Auto-generated method stub return
    * 0; }
    * 
    */
}