package org.studentcrm.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.mapper.AttendanceMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceMapper mapper;
	
	@Override
	public StudentVO readInfo(int s_id) {
		log.info("get: "+ s_id);
		return mapper.read(s_id);
	}

	@Override
	public int putMemo(AttendanceVO vo) {
		log.info("putMemo: "+ vo);
		return mapper.insertMemo(vo);
	}

	@Override
	public int updateStat(AttendanceVO vo) {
		log.info("update: " + vo);
		return mapper.updateStatus(vo);

	}

	@Override
	public AttendanceVO viewMemo(AttendanceVO vo) {
		log.info("view :" + vo);
		return null;
	}

}
