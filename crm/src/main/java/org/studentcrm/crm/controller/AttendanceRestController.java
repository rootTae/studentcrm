package org.studentcrm.crm.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.service.AttendanceService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/attendance/*")
@RestController
@Log4j2

public class AttendanceRestController {

   @Autowired
   AttendanceService service;
   
   // readInfo
   @GetMapping(value="/{s_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<StudentVO> get(@PathVariable("s_id") int s_id){
      log.info("get: " + s_id);
      StudentVO result = service.readInfo(s_id);
      log.info(result.getS_school());
      return new ResponseEntity<StudentVO>(result,HttpStatus.OK);
   }
   
   // s_list
   @GetMapping(value="/studentlist/{class_name}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<StudentVO>> s_list(@PathVariable("class_name") String class_name){
      log.info("s_class: " + class_name);
      List<StudentVO> studentsList = service.s_list(class_name);
      return new ResponseEntity<List<StudentVO>>(studentsList, HttpStatus.OK);
   }
   
   // classlistByt_id
   @GetMapping(value="/classlist/{t_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<ClassVO>> c_list(@PathVariable("t_id") int t_id){
      log.info("t_id: " + t_id);
      List<ClassVO> classList = service.c_list(t_id);
      return new ResponseEntity<List<ClassVO>>(classList, HttpStatus.OK);
   }
   
   // putMemo
   @PostMapping(value = "/new",
         consumes = "application/json",
         produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> put(@RequestBody AttendanceVO vo){
      log.info("s_id: " + vo.getS_id());
      int memoCnt = service.putMemo(vo);
      log.info("# of memo: " + memoCnt);
      return memoCnt == 1
            ? new ResponseEntity<String>("Success", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   // viewMemo
   @GetMapping(value="/{s_id}/{a_date}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> viewMemo(
         @PathVariable("s_id") int s_id,
         @PathVariable("a_date") Date a_date,
         @RequestBody AttendanceVO vo
         ){
      
      log.info("s_id" + s_id);
      log.info("date" + a_date);
      
      return new ResponseEntity<AttendanceVO>(service.viewMemo(vo), HttpStatus.OK);
   }
   
   // insertStat
   @PostMapping(value = "/initial/{s_id}/{a_date}",
		   consumes = "application/json;charset=utf-8",
		   produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<AttendanceVO> insert(
		   @RequestBody AttendanceVO vo,
		   @PathVariable("s_id") int s_id,
	       @PathVariable("a_date") String a_date
		   ){
	   	log.info("vo for insertStat:" + vo);
	    return (vo.getA_status() == null || vo.getA_status().isEmpty())
			   ? new ResponseEntity<AttendanceVO>(service.insertStat(vo), HttpStatus.OK) 
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }

   // updateStat
   @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
         value="/{s_id}/{a_date}", consumes="application/json;charset=UTF-8", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> update(
         @RequestBody AttendanceVO vo, 
         @PathVariable("s_id") int s_id,
         @PathVariable("a_date") String a_date
         ){
	  log.info(vo);
	  
		/*
		 * vo.setS_id(s_id); vo.setA_date(a_date);
		 */
      
      log.info(vo.getA_status());
      log.info("s_id"+s_id);
      log.info("AttendanceVO " + vo);
      return service.updateStat(vo) != null
            ? new ResponseEntity<>(service.updateStat(vo), HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @RequestMapping(method = RequestMethod.GET,
	        value="/{s_id}/{firstDayOfMonth}/{lastDayOfMonth}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<AttendanceVO>> getMonthlyAttendance(
	        @PathVariable("s_id") int s_id,
	        @PathVariable("firstDayOfMonth") String firstDayOfMonth,
	        @PathVariable("lastDayOfMonth") String lastDayOfMonth,
	        @RequestBody AttendanceVO vo
	        ){
				/*
				 * LocalDate firstDayOfMonth = month.withDayOfMonth(1); LocalDate lastDayOfMonth
				 * = month.withDayOfMonth(month.lengthOfMonth());
				 */
	    
	    List<AttendanceVO> result = service.getMonthlyAttendance(vo);

	    return new ResponseEntity<>(result, HttpStatus.OK);
	}
   
   
   
   
   
   
}