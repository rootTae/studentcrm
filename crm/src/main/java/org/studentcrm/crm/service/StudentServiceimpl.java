package org.studentcrm.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.mapper.StudentMapper;

import lombok.Setter;

@Service
public class StudentServiceimpl implements StudentService {
	@Setter(onMethod_ = {@Autowired})
	StudentMapper sMapper;
	
	@Override
	public StudentVO getStudent(int s_id) {
		return sMapper.getStudent(s_id);
	}

	@Override
	public int insertStudent(StudentVO vo) {
		return sMapper.insertStudent(vo);
	}

	@Override
	public int updateStudent(StudentVO vo) {
		return sMapper.updateStudent(vo);
	}

	@Override
	public int deleteStudent(int s_id) {
		return sMapper.deleteStudent(s_id);
	}
	
	@Override
	public List<StudentVO> getStudentName(String s_name) {
		//System.out.print("service s_name---------- : " +s_name);
		List<StudentVO> list = sMapper.getStudentName(s_name);
		return list;
	}
	@Override
	public int getLastId() {
		return sMapper.getLastId();
	}
	
//	//학생 id로 학급 정보 가져오기(class, student를 register로 조인)
//	@Override
//	public List<RegisterVO> getClassInfo(int s_id) {
//		List<RegisterVO> list = sMapper.getClassInfo(s_id);
//		//System.out.println("-----------------");
//		//System.out.println(list);
//		return list;
//	}
}
