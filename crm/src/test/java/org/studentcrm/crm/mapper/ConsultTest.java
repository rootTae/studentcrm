package org.studentcrm.crm.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.studentcrm.crm.command.ConsultVO;

import lombok.extern.log4j.Log4j2;
import oracle.net.aso.c;

@SpringBootTest
@Log4j2
public class ConsultTest {
   
   @Autowired
   private ConsultMapper mapper;
   
   @Test
   public void insertConsult() {
      ConsultVO vo = new ConsultVO();
      vo.setS_id(6);
      vo.setT_id(6);
      vo.setS_name("Hael");
      vo.setT_name("Chris");
      vo.setConsult_id(8);
      vo.setConsult_date("2023-11-28");
      vo.setConsult_content("I owe you again");
      
      log.info(vo);
      mapper.insertConsult(vo);
   }
   
   @Test
   public void showConsultByDateAndS_id() {
      ConsultVO vo = new ConsultVO();
      vo.setS_id(3);
      vo.setConsult_firstDay("2023-11-01");
      vo.setConsult_lastDay("2023-11-30");
      List<ConsultVO> list = mapper.showConsultByDateAndS_id(vo);;
      
      log.info(list.toString());
   }
   
   @Test
   public void showConsultByT_id() {
      ConsultVO vo = new ConsultVO();
      int t_id = 1;
      List<ConsultVO> list = mapper.showConsultByT_id(t_id);
      log.info(list.toString());
   }
   
   @Test
   public void updateConsult() {
      ConsultVO vo = new ConsultVO();
      int num = 7;
      int t_id = 6;
      vo.setS_id(3);
      vo.setConsult_title("Reannouncement");
      vo.setConsult_content("awww");
      vo.setConsult_date("2023-11-24");
      vo.setConsult_id(num);
      log.info(mapper.updateConsult(vo));
      List<ConsultVO> list = mapper.showConsultByT_id(t_id);
      log.info(list.toString());
   }
   
   @Test
   public void deleteConsult() {
      int num = 8;
      log.info(mapper.deleteConsult(num));
   }

}