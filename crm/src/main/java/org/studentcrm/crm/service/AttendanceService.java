package org.studentcrm.crm.service;

import java.util.List;

import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.command.TeacherVO;

public interface AttendanceService {
	public StudentVO readInfo(int s_id); //학생 이름을 눌렀을 때, 학생 전번, 학교 보여주기
	public List<StudentVO> s_list(String class_name); //반이름으로 애들 목록+정보 불러오기
	public List<ClassVO> c_list(int t_id); //t_id로 담당 classlist 불러오기
	
	public int putMemo(AttendanceVO vo); //출결 상황 박스 우측 상단 클릭하면 뜨는 메모
	public AttendanceVO viewMemo(AttendanceVO vo); // s_id와 a_date으로 해당 학생의 해당 날짜 메모 보기
	
	public int updateStat(AttendanceVO vo); //출석, 지각, 결석, 조퇴, 출석으로 돌아가는 update
	
}
