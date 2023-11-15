package org.studentcrm.crm.service;

import java.util.List;

import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;

public interface StudentService {
	//학생 정보 검색(화면 출력)
	public StudentVO getStudent(int s_id);
	//학생 정보 등록
	public int insertStudent(StudentVO vo);
	//학생 정보 수정
	public int updateStudent(StudentVO vo);
	//학생 정보 삭제
	public int deleteStudent(int s_id);
	//학생 이름 검색
	public List<StudentVO> getStudentName(String s_name);
	//최근 추가된 s_id 가져오기
	public int getLastId();
	
//	//학생 id로 학급 정보 가져오기(class, student를 register로 조인)
//	public List<RegisterVO> getClassInfo(int s_id);
}
