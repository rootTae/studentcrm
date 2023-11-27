package org.studentcrm.crm.controller;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.ConsultVO;
import org.studentcrm.crm.service.ConsultService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/consult/*")
@RestController
@Log4j2
public class ConsultRestController {

   @Autowired
   ConsultService service;
   //insert
   @PostMapping(value="/new", 
         produces= {MediaType.TEXT_PLAIN_VALUE}, 
         consumes="application/json")
   ResponseEntity<String> insertConsult(
         @RequestParam("s_id") String s_id,
         @RequestParam("consult_date") String consult_date,
         @RequestBody ConsultVO vo){
      log.info("insert controller(vo): " + vo);
      if (service.insertConsult(vo)) {
         return new ResponseEntity<String>("sucess", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
      } 
   }
   //update
   @RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH },
      value="/update/t_id",
      produces= {MediaType.TEXT_PLAIN_VALUE},
      consumes="application/json")
   public ResponseEntity<String> updateConsult(
      @PathVariable("t_id") int t_id,
      @RequestBody ConsultVO vo){    
      
      log.info("update controller(vo): " + vo);
      vo.setT_id(t_id);
      log.info(t_id);
      
      if(service.updateConsult(vo)) {
         return new ResponseEntity<String>("sucess", HttpStatus.OK);
      } else {
         return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
      } 
   }
}