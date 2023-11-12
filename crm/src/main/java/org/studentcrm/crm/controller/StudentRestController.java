package org.studentcrm.crm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.CommuteVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.CommuteService;
import org.studentcrm.crm.service.StudentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/studentRest")
@Log4j2
public class StudentRestController {
	@Setter(onMethod_ = {@Autowired})
	StudentService sService;
	
	@Setter(onMethod_ = {@Autowired})
	CommuteService cService;
	
	//============== 학생 정보 검색 ===============
	
	//학생 학번으로 검색(1개만 출력)
	@GetMapping(value = "/id/{s_id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_id") int s_id) {
		StudentVO vo = sService.getStudent(s_id);
		return new ResponseEntity<StudentVO>(vo, HttpStatus.OK);
	}
	
	//학생 이름으로 검색(리스트로 출력)
	@GetMapping(value = "/name/{s_name}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<StudentVO>> getStudent(@PathVariable("s_name") String s_name) {
	    //log.info("s_name---------- : " +s_name);
	    //System.out.print("fffffffffffffffffffffffffffff");
	    return new ResponseEntity<List<StudentVO>>(sService.getStudentName(s_name), HttpStatus.OK);
	}

	
	
	//============== 학생 정보 수정 ===============
	
	//학생 정보 추가
	@PostMapping(value="/insert",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertStudent(@RequestBody StudentVO vo){
		//log.info("학생 정보 추가~~~ "+vo);
		int result = sService.insertStudent(vo);
		//log.info("저장하자마자 가져오는 s_id"+vo.getS_id());
//		return result == 1 ?
//				new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		//자동증가된 s_id 반환(통학 정보에서 사용)
		int s_id = sService.getLastId();
		log.info(s_id);
		
		return result == 1 ?
				new ResponseEntity<>(String.valueOf(s_id), HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//학생 정보 삭제
	@DeleteMapping(value="/delete/{s_id}",
			produces={MediaType.TEXT_PLAIN_VALUE}) //숫자를 넘길거라서 plain_value
	public ResponseEntity<String> deleteStudent(@PathVariable("s_id") int s_id){
		//log.info("delete : "+s_id);
		return sService.deleteStudent(s_id) == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//학생 정보 수정
	@PostMapping(value="/update/{s_id}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateStudent(
			@RequestBody StudentVO vo,
			@PathVariable("s_id") int s_id){
		vo.setS_id(s_id);
		int result = sService.updateStudent(vo);
		//log.info("update : "+vo);
		return result == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//============== 학생 통학 정보 ===============
	
	//통학 정보 출력
	@GetMapping(value = "/commute/{s_id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommuteVO> getCommute(@PathVariable("s_id") int s_id) {
		CommuteVO vo = cService.getCommute(s_id);
		return new ResponseEntity<CommuteVO>(vo, HttpStatus.OK);
	}
	
	//통학 정보 추가
	@PostMapping(value="/insertC",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertCommute(@RequestBody CommuteVO vo){
		int result = cService.insertCommute(vo);
		return result == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//통학 정보 수정
	@PostMapping(value="/updateC/{s_id}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateCommute(
			@RequestBody CommuteVO vo,
			@PathVariable("s_id") int s_id){
		//vo.setS_id(s_id);
		int result = cService.updateCommute(vo);
		return result == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//통학 정보 삭제
	@DeleteMapping(value="/deleteC/{s_id}",
			produces={MediaType.TEXT_PLAIN_VALUE}) //숫자를 넘길거라서 plain_value
	public ResponseEntity<String> deleteCommute(@PathVariable("s_id") int s_id){
		//log.info("delete : "+s_id);
		return cService.deleteCommute(s_id) == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	
}
