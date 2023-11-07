package org.studentcrm.crm.service;

import java.util.List;
import java.util.Map;

import org.studentcrm.crm.command.StudentVO;

public interface StudentService {
	//학생 정보 검색(화면 출력)
	public StudentVO getStudent(int s_id);
	//학생 정보 등록
	public void insertStudent(StudentVO vo);
	//학생 정보 수정
	public boolean updateStudent(StudentVO vo);
	//학생 정보 삭제
	public void deleteStudent(int s_id);
	//검색어 자동완성
	List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;
}
