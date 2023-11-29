package org.studentcrm.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.studentcrm.crm.command.ImageAttachVO;
import org.studentcrm.crm.command.TeacherImageAttachVO;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.mapper.MemberMapper;
import org.studentcrm.crm.mapper.TeacherImageAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	TeacherImageAttachMapper tMapper;
	
	@Transactional
	@Override
	public int regist(TeacherVO vo) {
		int result = mapper.regist(vo);
		
		int lastTid = mapper.getLastId();
		//log.info(vo.getAttachImg());
		if(vo.getAttachImg() == null) {
			return 1;
		}
		vo.getAttachImg().setT_id(lastTid);
		tMapper.insert(vo.getAttachImg());
		
		return result;
	}
	
	@Transactional
	@Override
	public int update(TeacherVO vo) {
		tMapper.deleteDB(vo.getT_id());
		
		int result = mapper.update(vo);
		
		if(result > 0 && vo.getAttachImg() != null) {
			//log.info("getAttachImg가 null이 아님");
			vo.getAttachImg().setT_id(vo.getT_id());
			tMapper.insert(vo.getAttachImg());
		}
		//log.info("getAttachImg가 null임");
		return result;
	}

	@Override
	public TeacherVO login(String t_loginid, String t_pw) {
		return mapper.login(t_loginid, t_pw);
	}
	
	@Transactional
	@Override
	public int delete(int t_id) {
		//log.info("DB에서 삭제 : "+t_id);
		tMapper.deleteDB(t_id);
		return mapper.delete(t_id);
	}

	@Override
	public int idCheck(String t_loginid) {
		return mapper.idCheck(t_loginid);
	}

	@Override
	public TeacherVO select(int t_id) {
		return mapper.select(t_id);
	}
	
	@Override
	public int getLastId() {
		return mapper.getLastId();
	}
	
	
	@Override
	public TeacherImageAttachVO getAttachImg(int t_id) {
		
		//log.info("t_id"+t_id);
		//log.info(tMapper.findByTid(t_id));
		return tMapper.findByTid(t_id);
	}
}
