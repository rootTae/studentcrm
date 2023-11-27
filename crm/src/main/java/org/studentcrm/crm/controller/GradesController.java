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
import org.studentcrm.crm.command.ExamVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.GradesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/gradesF/")
@RestController
@Log4j2
public class GradesController {
	
	@Autowired
	private GradesService gservice;
	
	//학생 이름으로 학생 리스트 가져오기
	@GetMapping(value = "/{s_name}",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<StudentVO>> getStudentList(@PathVariable("s_name")String s_name){
		
		return new ResponseEntity<List<StudentVO>>(gservice.getStudentList(s_name), HttpStatus.OK);
	}
	
	//시험 이름으로 학생 리스트 가져오기
	@GetMapping(value ="/elist/{e_name}", produces = {MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8"})
	public ResponseEntity<List<ExamVO>> getexamList(@PathVariable("e_name") String e_name) {			
	    log.info("=====================.");
	    log.info(e_name);
	    return new ResponseEntity<List<ExamVO>>(gservice.getexamList(e_name), HttpStatus.OK);
	}

	
	//학생아이디로 검색 점수리스트 가져오기
	@GetMapping(value = "/{s_name}/{s_id}",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Exam_ScoreVO>> getScoreList(
			@PathVariable("s_name") String s_name,
			@PathVariable("s_id") int s_id)
			{
		return new ResponseEntity<List<Exam_ScoreVO>>(gservice.getScoreList(s_id), HttpStatus.OK);
	}

	//시험 점수 생성
		@PostMapping(value = "/new",
				consumes = "application/json",
				produces = {MediaType.APPLICATION_JSON_VALUE+ ";charset=UTF-8"})
		public ResponseEntity<String> scoreInsert(@RequestBody Exam_ScoreVO vo){
			
			log.info("exam+scorevo" +vo);
			int result =gservice.scoreRegister(vo);
			log.info("insertScoreResult" + result);
			return result == 1 ?
					new ResponseEntity<>("점수등록 성공" , HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		//시험 생성
				@PostMapping(value = "/neweaxm",
						consumes = "application/json",
						produces = {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> examInsert(@RequestBody ExamVO vo){
					
					log.info("exam+scorevo" +vo);
					int result =gservice.examRegister(vo);
					log.info("insertScoreResult" + result);
					return result == 1 ?
							new ResponseEntity<>("시험등록 성공" , HttpStatus.OK)
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
				}
				
		
		
	//시험 점수 수정
		@RequestMapping(method = {RequestMethod.PUT , RequestMethod.PATCH},
				value ="/{s_id}",
				consumes = "application/json",
		        produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> scoreModify(
				@RequestBody Exam_ScoreVO vo,
				@PathVariable("s_id") int s_id){			
			log.info("s_id: "+s_id);
		    log.info("scoreModify: "+vo);
			return gservice.scoreModify(vo)==1
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		//시험 수정
		@RequestMapping(method = {RequestMethod.PUT , RequestMethod.PATCH},
				value ="/elist/{e_id}",
				consumes = "application/json",
		        produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> examModify(
				@RequestBody ExamVO vo,
				@PathVariable("e_id") int e_id){
			vo.setE_id(e_id);
			log.info("s_id: "+e_id);
		    log.info("scoreModify: "+vo);
			return gservice.examModify(vo)==1
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
	//시험점수 삭제
		@DeleteMapping(value ="/{score_id}",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> scoreRemove(@PathVariable("score_id") int score_id){
			log.info("scoreRemove" +score_id);
			return gservice.scoreRemove(score_id)==1
			? new ResponseEntity<String>("success",HttpStatus.OK)
			:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		//시험 삭제
				@DeleteMapping(value ="/elist/{e_id}",
						produces = {MediaType.TEXT_PLAIN_VALUE})
				public ResponseEntity<String> examRemove(@PathVariable("e_id") int e_id){
					log.info("examRemove" +e_id);
					return gservice.examRemove(e_id)==1
					? new ResponseEntity<String>("success",HttpStatus.OK)
					:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);	
				}
		
		
		//전체인원 과목 평균
		@PostMapping(value = "/subAvg",
				consumes = "application/json",
				produces = {MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<ScoreVO> SubjectsTotalAvg(
				@RequestBody Exam_ScoreVO vo){			
			log.info("getSubjectsTotalAvg" +vo);
			return new ResponseEntity<ScoreVO>(gservice.getsubjectAvg(vo), HttpStatus.OK);
		}
		
		//국영수 평균 값
		@PostMapping(value = "/avg",
				consumes = "application/json",
				produces = {MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<Exam_ScoreVO> AvgScore(@RequestBody Exam_ScoreVO vo) {

			vo=gservice.avgScore(vo);

			return new ResponseEntity<Exam_ScoreVO>(vo, HttpStatus.OK);
		}
		
		
		
		
}
