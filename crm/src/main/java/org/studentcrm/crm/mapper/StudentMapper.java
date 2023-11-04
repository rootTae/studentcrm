package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.StudentVO;

@Mapper
@Repository
public interface StudentMapper {
	//학생 정보 검색(화면 출력)
	public StudentVO getStudent(int s_id);
	//학생 정보 등록
	public void insertStudent(StudentVO vo);
	//학생 정보 수정
	public boolean updateStudent(StudentVO vo);
	//학생 정보 삭제
	public void deleteStudent(int s_id);
}
