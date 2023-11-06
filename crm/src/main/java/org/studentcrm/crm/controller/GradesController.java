package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.service.GradesService;


import lombok.extern.log4j.Log4j2;

@RequestMapping("/grades/*")
@Controller
@Log4j2
public class GradesController {

	
	@Autowired
	private GradesService service;
	
	@RequestMapping("")
	public String goMain() {
		return "rr";  //메인으로
	}
	
	
	//시험 점수 생성
	
		
	
	
	//학생 이름으로 학생 리스트 가져오기
	
	
	
}
