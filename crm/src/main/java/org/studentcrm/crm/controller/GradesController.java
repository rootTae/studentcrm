package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.service.GradesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/grades/")
@RestController
@Log4j2
@AllArgsConstructor
public class GradesController {

	
	@Autowired
	private GradesService service;
	
	//시험 점수 생성
	@PostMapping(value = "/insertScore",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Exam_ScoreVO vo){
		
		log.info("exam+scorevo" +vo);
		int result =service.scoreRegister(vo);
		log.info("insertScoreResult" + result);
		return result == 1 ?
				new ResponseEntity<>("점수등록 성공" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
