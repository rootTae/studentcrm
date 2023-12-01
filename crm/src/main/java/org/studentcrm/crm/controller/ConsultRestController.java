package org.studentcrm.crm.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.ConsultVO;
import org.studentcrm.crm.command.Criteria;
import org.studentcrm.crm.service.ConsultService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/consult/*")
@RestController
@Log4j2
public class ConsultRestController {

   @Autowired
   ConsultService service;
   // insert the context of the consulation. 상담기록 입력
   @PostMapping(value="/new/{s_id}/{consult_date}", 
         produces= {MediaType.TEXT_PLAIN_VALUE}, 
         consumes="application/json;charset=UTF-8")
   ResponseEntity<String> insertConsult(
		 @PathVariable("s_id") int s_id,
         @PathVariable("consult_date") String consult_date,
         @RequestBody ConsultVO vo){
      log.info("insert controller(vo): " + vo);
      if (service.insertConsult(vo)) {
         return new ResponseEntity<String>("success", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
      } 
   }
   
   //update the context of the consultant. 상담 기록 수정
   @RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH },
      value="/update/{consult_id}",
      produces= {MediaType.TEXT_PLAIN_VALUE},
      consumes="application/json")
   public ResponseEntity<String> updateConsult(
      @PathVariable("consult_id") int consult_id,
      @RequestBody ConsultVO vo){    
      
      log.info("update controller(vo): " + vo);
      vo.setT_id(consult_id);
      log.info(consult_id);
      
      if(service.updateConsult(vo)) {
         return new ResponseEntity<String>("success", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
      } 
   }
   
   
   @DeleteMapping(value="/delete/{consult_id}", produces={MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> deleteConsult(
		@PathVariable("consult_id") int consult_id
		){
	   	log.info("delete controller(consult_id): "+ consult_id);
	   	if(service.deleteConsult(consult_id)) {
	         return new ResponseEntity<String>("success", HttpStatus.OK);
	      } else {
	         return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	      } 
   }
   
   @GetMapping(value="/show", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<ConsultVO>> showConsultByDateAndS_id(
		   @RequestParam("s_id") String s_id,
		   @RequestParam("FirstDay") String firstDay,
		   @RequestParam("lastDay") String lastDay		   
		   ){
	   
	   	   log.info("controller-showDateS_id(s_id)"+ s_id);
	   	   log.info("controller-showDateS_id(firstDay)"+ firstDay);
	   	   log.info("controller-showDateS_id(lastDay)"+ lastDay);
	   	   ConsultVO vo = new ConsultVO();
	   	   
	   	   vo.setS_id(Integer.parseInt(s_id));
	   	   vo.setConsult_firstDay(firstDay);
	   	   vo.setConsult_lastDay(lastDay);
	   	   
	   	   List<ConsultVO> list = service.showConsultByDateAndS_id(vo);
	   	   
	   	   if(list != null) {
	   		   return new ResponseEntity<List<ConsultVO>>(list,HttpStatus.OK);
	   	   } else {
	   		   return new ResponseEntity<List<ConsultVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	   	   }
   }
	   	   
	   @GetMapping(value="/show/{t_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
	   public ResponseEntity<List<ConsultVO>> showConsultByT_id(
			   @PathVariable("t_id") int t_id
			   ){
		   	   log.info("controller-showt_id"+t_id);
		   	   ConsultVO vo = new ConsultVO();
		   	   vo.setT_id(t_id);
		   	   
		   	   List<ConsultVO> list = service.showConsultByT_id(t_id); 
		   	   
		   	   if(list != null) {
		   		   return new ResponseEntity<List<ConsultVO>>(list,HttpStatus.OK);
		   	   } else {
		   		   return new ResponseEntity<List<ConsultVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		   	   }
		   	   
	   }
	   	   
	   @GetMapping(value="/show/content/{s_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
	   public ResponseEntity<List<ConsultVO>> getContent(
			  @PathVariable("s_id") int s_id
			  ){
		   	  log.info("controller-getContent(consult_id): "+ s_id);
		   	  ConsultVO vo = new ConsultVO();
		   	  vo.setS_id(s_id);
		   	  log.info("controller-getContent(vo): "+vo.getS_id());
		   	  
		   	  List<ConsultVO> list = service.getContent(s_id);
		   	  
		   	  if(list != null) {
		   		   return new ResponseEntity<List<ConsultVO>>(list,HttpStatus.OK);
		   	   } else {
		   		   return new ResponseEntity<List<ConsultVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		   	   }
	   }
	   
	   @GetMapping(value="/show/list/{s_name}", produces= {MediaType.APPLICATION_JSON_VALUE})
	   public ResponseEntity<List<ConsultVO>> getStudentList(
			   @PathVariable("s_name") String s_name
			   ) {
		   	   log.info("controller-getStudentList(s_name)" + s_name);
		   	   ConsultVO vo = new ConsultVO();
		   	   vo.setS_name(s_name);
		   	   
		   	   List<ConsultVO> list = service.getStudentList(s_name);
		   	   if(list!=null) {
		   		   return new ResponseEntity<List<ConsultVO>>(list, HttpStatus.OK);
		   	   } else {
		   		   return new ResponseEntity<List<ConsultVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		   	   }

	   }
	   
	   
	   	//페이징 처리
		/*
		 * @RequestMapping(value = "/list", method = RequestMethod.GET) public String
		 * list(Model model, Criteria cri) {
		 * 
		 * //페이징 게시글 가져오기... List<ConsultVO> list = service.show(cri);
		 * 
		 * //model에 담아서 전달 model.addAttribute("board_list", list);
		 * 
		 * //PageVO 전달.... int total = boardService.getTotal();
		 * model.addAttribute("pageMaker", new PageVO(cri, total));
		 * 
		 * return "board/list"; }
		 */
	   	    
   
}