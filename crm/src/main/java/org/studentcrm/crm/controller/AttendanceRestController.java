package org.studentcrm.crm.controller;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
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
   
   // getStat
   @GetMapping(value="/read/{s_id}/{a_date}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> readForUpdate(
         @PathVariable("s_id") int s_id,
         @PathVariable("a_date") String a_date,
         @RequestBody AttendanceVO vo
         ){
      log.info("s_id for readForUpdate at controller: " + s_id);
      AttendanceVO result = service.readForUpdate(vo);
      log.info("vo for readForUpdate at controller: " + vo);
      return new ResponseEntity<AttendanceVO>(result, HttpStatus.OK);
   }
   
   // s_list
   @GetMapping(value="/studentlist/{class_name}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<StudentVO>> s_list(@PathVariable("class_name") String class_name){
      log.info("s_class for s_list at controller: " + class_name);
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
         produces = {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> insert(
         @RequestBody AttendanceVO vo,
         @PathVariable("s_id") int s_id,
          @PathVariable("a_date") String a_date
         ){
         log.info("vo for insertStat:" + vo);
         log.info("vo A_status : "+vo.getA_status().isEmpty());
         AttendanceVO result = service.insertStat(vo);
       return (result !=null)
            ? new ResponseEntity<>(result, HttpStatus.OK) 
            : new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
   }
   
   // updateStat
   @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
         value="/{s_id}/{a_date}", consumes="application/json;charset=UTF-8", 
         produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> update(
         @RequestBody AttendanceVO vo, 
         @PathVariable("s_id") int s_id,
         @PathVariable("a_date") String a_date
         ){
   
      log.info("a_status for controller updateStatvo" + vo.getA_status());
      
      log.info("AttendanceVO at controller" + vo);
      return service.updateStat(vo) != null
            ? new ResponseEntity<>(service.updateStat(vo), HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   } 
   
   @GetMapping(value="/chart", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> chart(
		   @RequestBody AttendanceVO vo
		   ){
	    
	   return new ResponseEntity<AttendanceVO>(vo, HttpStatus.OK); 
   }
   
   
   
   @RequestMapping(method = RequestMethod.GET,
           value="/{s_id}/{firstDayOfMonth}/{lastDayOfMonth}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<AttendanceVO>> getMonthlyAttendance(
           @PathVariable("s_id") int s_id,
           @PathVariable("firstDayOfMonth") String firstDayOfMonth,
           @PathVariable("lastDayOfMonth") String lastDayOfMonth
//           ,@RequestBody AttendanceVO vo
           ){
	   
       log.info("GMA: " + lastDayOfMonth);
//	   AttendanceVO vo = new AttendanceVO();
//	   vo.setS_id(s_id); 
//	   LocalDate firstLocalDate = LocalDate.parse(firstDayOfMonth);
//	   LocalDate lastLocalDate = LocalDate.parse(lastDayOfMonth);
//	   vo.setFirstDayOfMonth(firstLocalDate);
//	   vo.setLastDayOfMonth(lastLocalDate);
//       log.info("GMA: " + vo);
       LocalDate month = LocalDate.now(); // 현재 월을 사용
       LocalDate firstDayOfMonth1 = month.withDayOfMonth(1);
       LocalDate lastDayOfMonth1 = month.withDayOfMonth(month.lengthOfMonth());
       
       AttendanceVO attendanceVO = new AttendanceVO();
       attendanceVO.setS_id(s_id);
       attendanceVO.setFirstDayOfMonth(firstDayOfMonth1);
       attendanceVO.setLastDayOfMonth(lastDayOfMonth1);
       
       log.info(attendanceVO);
       System.out.println(s_id);
       System.out.println(firstDayOfMonth1);
       System.out.println(lastDayOfMonth1);
	   
       List<AttendanceVO> result = service.getMonthlyAttendance(attendanceVO);
       log.info("결과 : "+result);
       return new ResponseEntity<>(result, HttpStatus.OK);
   }
   
   
   
   
   
   
}