package org.studentcrm.crm.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.studentcrm.crm.service.AttendanceService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/attendance/*")
@RestController
@Log4j2

public class AttendanceRestController {

   @Autowired
   AttendanceService service;
   
   // show the basic information of each student
   // 각 학생의 기본 개인 정보 보여주기
   @GetMapping(value="/{s_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<StudentVO> get(@PathVariable("s_id") int s_id){
      log.info("get: " + s_id);
      StudentVO result = service.readInfo(s_id);
      log.info(result.getS_school());
      return new ResponseEntity<StudentVO>(result,HttpStatus.OK);
   }
   
   // show student's monthly attendance status by his/her own id, date, and the status(attend/late, ...)
   // when the year and the month get clicked on client's side, each student's daily status will be inserted and shown
   // on the attendance sheet
   // 학생의 id, 날짜, 출결 상태 들을 읽어와서, 출석부에 해당 년,월을 선택하면 한 달치 출석이 기록돼서 나타난다.
  // @GetMapping(value="/read/{s_id}/{a_date}", produces= {MediaType.APPLICATION_JSON_VALUE})
   @GetMapping(value="/read", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> readForUpdate(
		   @RequestParam("s_id") String s_id,
		   @RequestParam("a_date") String a_date
         ){
      log.info("s_id for readForUpdate at controller: " + s_id);
      AttendanceVO vo = new AttendanceVO();
      vo.setA_date(a_date);
      vo.setS_id(Integer.parseInt(s_id));
      
      AttendanceVO result = service.readForUpdate(vo);
      log.info("vo for readForUpdate at controller: " + vo);
      return new ResponseEntity<AttendanceVO>(result, HttpStatus.OK);
   }
   
   // get the list of the students by class name
   // 반 이름으로 학생들 리스트 받아오기
   @GetMapping(value="/studentlist/{class_name}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<StudentVO>> s_list(@PathVariable("class_name") String class_name){
      log.info("s_class for s_list at controller: " + class_name);
      List<StudentVO> studentsList = service.s_list(class_name);
      return new ResponseEntity<List<StudentVO>>(studentsList, HttpStatus.OK);
   }
   
   
   
   // get the list of classes by teacher's id(when you log in, these will be shown automatically
   // 로그인하는 선생님의 아이디에 따라 학생들 리스트가 나오게 함
   @GetMapping(value="/classlist/{t_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<List<ClassVO>> c_list(@PathVariable("t_id") int t_id){
      //log.info("t_id: " + t_id);
      List<ClassVO> classList = service.c_list(t_id);
      return new ResponseEntity<List<ClassVO>>(classList, HttpStatus.OK);
   }
   
   // insert memo on each day by student's id
   // 해당 일의 메모를 학생 아이디로 기록
   @PostMapping(value = "/new",
         consumes = "application/json",
         produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> put(@RequestBody AttendanceVO vo){
      //log.info("s_id: " + vo.getS_id());
      int memoCnt = service.putMemo(vo);
      //log.info("# of memo: " + memoCnt);
      return memoCnt == 1
            ? new ResponseEntity<String>("Success", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   // show the memo by student's id, and date
   // 해당 일의 메모를 학생 아이디로 불러와 보여줌
   @GetMapping(value="/{s_id}/{a_date}", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> viewMemo(
         @PathVariable("s_id") int s_id,
         @PathVariable("a_date") Date a_date,
         @RequestBody AttendanceVO vo
         ){
      
     // log.info("s_id" + s_id);
     // log.info("date" + a_date);
      
      return new ResponseEntity<AttendanceVO>(service.viewMemo(vo), HttpStatus.OK);
   }
   
   // insert status by student's id and the date the user wants to use
   // 학생의 id와 해당 일자로 학생의 출결 상태를 기록
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
   
   // update status by student's id and the date the user wants to use
   // 학생의 id와 해당 일자로 학생의 출결 상태를 수정
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
   
   
   // show the chart by the data stored in advance
   @GetMapping(value="/chart", produces= {MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity<AttendanceVO> chart(
		   @RequestBody AttendanceVO vo
		   ){
	    
	   return new ResponseEntity<AttendanceVO>(vo, HttpStatus.OK); 
   }
   
   
   // get student's monthly status(attend on time: 20, late: 5, ...)
   // 학생들의 월별 출결 상태를, 분류에 따라 정리
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

		/*
		 * LocalDate month = LocalDate.now(); // 현재 월을 사용 LocalDate firstDayOfMonth1 =
		 * month.withDayOfMonth(1); LocalDate lastDayOfMonth1 =
		 * month.withDayOfMonth(month.lengthOfMonth());
		 */
       
       AttendanceVO attendanceVO = new AttendanceVO();
       attendanceVO.setS_id(s_id);
       attendanceVO.setFirstDayOfMonth(firstDayOfMonth);
       attendanceVO.setLastDayOfMonth(lastDayOfMonth);
       
       log.info(attendanceVO);
       System.out.println(s_id);
       System.out.println(firstDayOfMonth);
       System.out.println(lastDayOfMonth);
	   
       List<AttendanceVO> result = service.getMonthlyAttendance(attendanceVO);
       log.info("결과 : "+result);
       return new ResponseEntity<>(result, HttpStatus.OK);
   }
   
   
   
   
   
   
}