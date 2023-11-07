package org.studentcrm.crm.service;

import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.StudentVO;

public interface AttendanceService {
	public StudentVO readInfo(int s_id); //학생 이름을 눌렀을 때, 학생 전번, 학교 보여주기
	public int putMemo(AttendanceVO vo); //출결 상황 박스 우측 상단 클릭하면 뜨는 메모
	public int updateStat(AttendanceVO vo); //출석, 지각, 결석, 조퇴, 출석으로 돌아가는 update
	
}
