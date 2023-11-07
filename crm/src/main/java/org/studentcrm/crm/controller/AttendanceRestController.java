//package org.studentcrm.crm.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//import org.studentcrm.crm.command.AttendanceVO;
//import org.studentcrm.crm.command.StudentVO;
//import org.studentcrm.crm.service.AttendanceService;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j2;
//
//@RequestMapping("/attendance/*")
//@RestController
//@Log4j2
//
//public class AttendanceRestController {
//
//	@Autowired
//	AttendanceService service;
//	
//	// readInfo
//	@GetMapping(value="/{s_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<StudentVO> get(@PathVariable("s_id") int s_id){
//		log.info("get: " + s_id);
//				
//		return new ResponseEntity<StudentVO>(service.readInfo(s_id),HttpStatus.OK);
//	}
//	// putMemo
//	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
//			value="/{s_id}", consumes = "application/json", produces= {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<String> put(@RequestBody AttendanceVO vo, @PathVariable("s_id") int s_id){
//		vo.setS_id(s_id);
//		log.info("s_id: " + s_id);
//		log.info("Attendance: " + vo);
//		return service.putMemo(vo) == 1
//				? new ResponseEntity<String>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	// updateStat
//	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
//			value="/{s_id}", consumes="application/json", produces= {MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<String> update(@RequestBody AttendanceVO vo, @PathVariable("s_id") int s_id){
//		vo.setS_id(s_id);
//		log.info("s_id"+s_id);
//		log.info("AttendanceVO " + vo);
//		return service.updateStat(vo) == 1
//				? new ResponseEntity<String>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//			
//	
//}
