package org.studentcrm.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.ScoreVO;
import org.studentcrm.crm.command.ExamVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.mapper.GradesMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class GradesServiceImple implements GradesService {

	@Setter(onMethod_ = {@Autowired})
	private GradesMapper mapper;
	
	@Override //점수 입력
	public int scoreRegister(Exam_ScoreVO vo) {
		return mapper.insertScore(vo);
	}

	@Override //점수 수정
	public int scoreModify(Exam_ScoreVO vo) {
		return mapper.updateScore(vo);
	}

	@Override //점수 삭제
	public int scoreRemove(int score_id) {
		return mapper.deleteScore(score_id);
	}

	@Override//학생 이름으로 학생 리스트 가져오기
	public List<StudentVO> getStudentList(String s_name) {
		return mapper.getStudentList(s_name);
	}

	@Override//학생아이디로 검색 점수리스트 가져오기
	public List<Exam_ScoreVO> getScoreList(int s_id) {
		return mapper.getScoreList(s_id);
	}
	@Override //평균
	public Exam_ScoreVO avgScore(Exam_ScoreVO vo) {
		return mapper.avgScore(vo);
	}
	
	@Override //각 과목당 평균 전체 평균
	public ScoreVO getsubjectAvg(Exam_ScoreVO vo) {
          
		return mapper.subjectAvg(vo);
	}
	
	@Override
	public int examModify(ExamVO vo) {		
		return mapper.updateExam(vo);
	}
	
	@Override
	public int examRegister(ExamVO vo) {		
		return mapper.insertExam(vo);
	}
	
	@Override
	public int examRemove(int e_id) {
		return mapper.deleteExam(e_id);
	}
	
	@Override
	public List<ExamVO> getexamList(String e_name) {		
		return mapper.getexamList(e_name);
	}
	
}
