package org.studentcrm.crm.service;

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
	public void insertStudent(StudentVO vo) {
		sMapper.insertStudent(vo);
	}

	@Override
	public boolean updateStudent(StudentVO vo) {
		return sMapper.updateStudent(vo);
	}

	@Override
	public void deleteStudent(int s_id) {
		sMapper.deleteStudent(s_id);
	}

}
