package org.studentcrm.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.mapper.AttendanceMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceMapper mapper;
	
	@Override
	public StudentVO readInfo(int s_id) {
		log.info("s_id for readInfo: "+ s_id);
		return mapper.read(s_id);
	}

	@Override
	public int putMemo(AttendanceVO vo) {
		log.info("vo for putMemo: "+ vo);
		return mapper.insertMemo(vo);
	}

	@Override
	public int updateStat(AttendanceVO vo) {
		log.info("vo for updateStat: " + vo);
		return mapper.updateStatus(vo);

	}

	@Override
	public AttendanceVO viewMemo(AttendanceVO vo) {
		log.info("vo for viewMemo :" + vo);
		return mapper.readMemo(vo);
	}

	@Override
	public List<StudentVO> s_list(String class_name) {
		List<StudentVO> studentsList = mapper.s_listByClass(class_name);
	    return studentsList;
	}

	@Override
	public List<ClassVO> c_list(int t_id) {
		log.info("t_id for t_class" + t_id);
		return mapper.classListByTeacher(t_id);
	}

}
