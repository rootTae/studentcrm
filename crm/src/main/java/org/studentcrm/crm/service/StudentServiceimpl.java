package org.studentcrm.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}
