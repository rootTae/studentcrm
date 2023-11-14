package org.studentcrm.crm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ScoreVO;
import org.studentcrm.crm.command.ExamVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.StudentVO;

@Mapper
@Repository
public interface GradesMapper {

	public int insertScore(Exam_ScoreVO vo); //성적 입력
	public int deleteScore(int score_id);	 //성적 삭제
	public int updateScore(Exam_ScoreVO vo); //성적 수정
	public List<Exam_ScoreVO> geTotalScoreList(); //시험점수리스트 가져오기
	public ScoreVO SubjectsAvg(List<Exam_ScoreVO> list); //과목평균 값
	public List<StudentVO> getStudentList(String s_name); //학생이름으로 검색
	public List<Exam_ScoreVO> getScoreList(int s_id); //학생번호로 점수 조회
	
	
	public Exam_ScoreVO avgScore(Exam_ScoreVO vo); //국영수 평균 구하기	
	
	public ScoreVO subjectAvg(Exam_ScoreVO vo); //과목당 평균 구하기
	
	public int insertExam(ExamVO vo);
	public int deleteExam(int e_id);	 //시험 삭제
	public int updateExam(ExamVO vo); //시험 수정
	
	public List<ExamVO> getexamList(String e_name);
	
	
	
	
	//public AvgVO korAvg(List<Exam_ScoreVO> list);	//국어 평균 값
	//public AvgVO engAvg(List<Exam_ScoreVO> list);	//영어 평균 값
	//public AvgVO mathAvg(List<Exam_ScoreVO> list);//수학 평균 값
	//public ScoreVO avgScore(Exam_ScoreVO vo); 	//국영수 평균 값 구하기
	
}
