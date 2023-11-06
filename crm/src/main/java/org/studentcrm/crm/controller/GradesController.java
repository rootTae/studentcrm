package org.studentcrm.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.GradesService;


import lombok.extern.log4j.Log4j2;

@RequestMapping("/grades/*")
@Controller
@Log4j2
public class GradesController {

	
	@Autowired
	private GradesService Gservice;
	
	@RequestMapping("")
	public String goMain() {
		return "index";  //메인으로
	}
	
	//학생 이름으로 학생리스트 조회
	@RequestMapping(value = "/studentList", method = RequestMethod.GET)
	@ResponseBody
	public List<StudentVO> getGradesStudentList(@RequestParam("s_name") String s_name){
		
		List<StudentVO> list = Gservice.getStudentList(s_name);
		
		return list;
	}
	
	
	
	
	
	
	//시험 점수 생성
	
		
	
	
	//학생 이름으로 학생 리스트 가져오기
	
	
	
}
