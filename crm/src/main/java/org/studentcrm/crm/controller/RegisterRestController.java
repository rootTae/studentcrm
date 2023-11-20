package org.studentcrm.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.ScoreVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.ExamVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.GradesService;
import org.studentcrm.crm.service.RegisterService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/registerC/")
@RestController
@Log4j2
public class RegisterRestController {

	
	@Autowired
	private GradesService gservice;
	
	@Autowired
	private RegisterService rservice;
	
	//학생 이름으로 학생 리스트 가져오기
	@GetMapping(value = "/{s_name}",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<StudentVO>> getStudentList(@PathVariable("s_name")String s_name){
		
		return new ResponseEntity<List<StudentVO>>(gservice.getStudentList(s_name), HttpStatus.OK);
	}
	
	//반 이름으로 반 리스트 가져오기
	@GetMapping(value = "/class",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ClassVO>> getClassList(){		
		return new ResponseEntity<List<ClassVO>>(rservice.getClassList(), HttpStatus.OK);
	}
	
	//수강신청 리스트 가져오기
	@GetMapping(value = "/class/{s_id}",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<RegisterVO>> getRegistertList(@PathVariable("s_id")int s_id){		
		return new ResponseEntity<List<RegisterVO>>(rservice.getRegistertList(s_id), HttpStatus.OK);
	}

	//수강신청
	@PostMapping(value = "/newregister",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> Rregister(@RequestBody RegisterVO vo){
		
		log.info("register" +vo);
		int result =rservice.rRegister(vo);
		log.info("registerResult" + result);
		return result == 1 ?
				new ResponseEntity<>("시험등록 성공" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	//수강신청 변경
	@RequestMapping(method = {RequestMethod.PUT , RequestMethod.PATCH},
			value ="/class/{r_id}",
			consumes = "application/json",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> registerModify(
			@RequestBody RegisterVO vo,
			@PathVariable("r_id") int r_id){			
		log.info("r_id: "+r_id);
	    log.info("registerModify: "+vo);
		return rservice.rModify(vo)==1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	//수강신청 삭제
	@DeleteMapping(value ="/{r_id}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> registerRemove(@PathVariable("r_id") int r_id){
		log.info("registerRemove" +r_id);
		return rservice.rRemove(r_id)==1
		? new ResponseEntity<String>("success",HttpStatus.OK)
		:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	
	
	
	
}
