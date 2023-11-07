package org.studentcrm.crm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.StudentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/studentInfo")
@Log4j2
public class StudentRestController {
	@Setter(onMethod_ = {@Autowired})
	StudentService sService;
	
	//학번을 입력하면 해당 학생 정보를 화면에 출력
	//학번은 이름 검색 후 선택 할 수 있도록 만들기. (동명이인일 경우)
	//이름 검색
//	@GetMapping(value="/{s_search}",
//			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_search") String s_search) {
//		log.info("s_search : "+s_search);
//		return null;
//		return new ResponseEntity<StudentVO>(sService.getStudent(s_search), HttpStatus.OK);
//	}
	
	//학번 검색
//	@PostMapping(value="/{s_search}",
//			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_id") int s_search) {
//		log.info("s_id : "+s_search);
//		return new ResponseEntity<StudentVO>(sService.getStudent(s_search), HttpStatus.OK);
//	}
//	
	
//	@PostMapping("/s_search")
//    public String s_search(@RequestParam("s_search") String input) {
//        try {
//            int intValue = Integer.parseInt(input);
//            return "입력된 값은 정수입니다: " + intValue;
//        } catch (NumberFormatException e) {
//            return "입력된 값은 문자열입니다: " + input;
//        }
//    }
	
	@PostMapping(value="/{s_search}",
	produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_id") String s_search) {
		log.info("s_id : "+s_search);
		return null;
		
//		return new ResponseEntity<StudentVO>(sService.getStudent(s_search), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/autocomplete")
	public @ResponseBody Map<String, Object> autocomplete
    						(@RequestParam Map<String, Object> paramMap) throws Exception{

		List<Map<String, Object>> resultList = sService.autocomplete(paramMap);
		paramMap.put("resultList", resultList);
		log.info(paramMap);
		return paramMap;
	}

	
}
