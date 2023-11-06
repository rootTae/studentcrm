package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.StudentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/student/*")
@Log4j2
public class StudentController {
	@Setter(onMethod_ = {@Autowired})
	StudentService sService;
	
	@RequestMapping("")
	public String student() {
		return "student/student";
	}
	
	//학번을 입력하면 해당 학생 정보를 화면에 출력
	//학번은 이름 검색 후 선택 할 수 있도록 만들기. (동명이인일 경우)
	@GetMapping(value="/{s_id}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_id") int s_id) {
		log.info("s_id : "+s_id);
		return new ResponseEntity<StudentVO>(sService.getStudent(s_id), HttpStatus.OK);
	}
	
}
