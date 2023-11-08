package org.studentcrm.crm.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ScoreVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.StudentVO;

@Repository
@Mapper
public interface GradesService {

	public int scoreRegister(Exam_ScoreVO vo); //점수 입력
	public int scoreModify(Exam_ScoreVO vo); //점수 수정
	public int scoreRemove(int score_id); //점수 삭제
	
	//public ScoreVO getSubjectsTotalAvg(List<Exam_ScoreVO> list); //전체인원 과목 평균 구하기
	//public ScoreVO getAvgScore(Exam_ScoreVO vo); //국영수 평균 구하기

	
	public List<StudentVO> getStudentList(String s_name);//학생 이름으로 학생 리스트 가져오기
	public List<Exam_ScoreVO> getScoreList(int s_id, String s_name); //학생아이디로 검색 점수리스트 가져오기
	
	
	
}
