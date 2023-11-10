package org.studentcrm.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.mapper.RegistMapper;

@Service
public class RegistServiceImpl implements RegistService {

	@Autowired
	RegistMapper mapper;
	
	@Override
	public int regist(TeacherVO vo) {
		return mapper.regist(vo);
	}

	@Override
	public int update(TeacherVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int login(String t_loginid) {
		return mapper.login(t_loginid);
	}

	@Override
	public void delete(String t_loginid) {
		mapper.delete(t_loginid);
	}

	@Override
	public int idCheck(String t_loginid) {
		return mapper.idCheck(t_loginid);
	}



}
