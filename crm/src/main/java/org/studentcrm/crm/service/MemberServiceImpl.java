package org.studentcrm.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public int regist(TeacherVO vo) {
		return mapper.regist(vo);
	}

	@Override
	public int update(TeacherVO vo) {
		return mapper.update(vo);
	}

	@Override
	public TeacherVO login(String t_loginid, String t_pw) {
		return mapper.login(t_loginid, t_pw);
	}

	@Override
	public void delete(int t_id) {
		mapper.delete(t_id);
	}

	@Override
	public int idCheck(String t_loginid) {
		return mapper.idCheck(t_loginid);
	}

	@Override
	public TeacherVO select(int t_id) {
		return mapper.select(t_id);
	}

}
