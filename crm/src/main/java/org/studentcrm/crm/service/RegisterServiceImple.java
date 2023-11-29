package org.studentcrm.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.ScoreVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.ExamVO;
import org.studentcrm.crm.command.Exam_ScoreVO;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.mapper.GradesMapper;
import org.studentcrm.crm.mapper.RegisterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RegisterServiceImple implements RegisterService {

	@Setter(onMethod_ = {@Autowired})
	private RegisterMapper mapper;
	
	//수강신청
	@Override
	public int rRegister(RegisterVO vo) {		
		return mapper.registerClass(vo);
	}
	
	//수강신청 삭제
	@Override
	public int rRemove(int r_id) {
		return mapper.deleteRegister(r_id);
	}
	
	//수강신청 변경
	@Override
	public int rModify(RegisterVO vo) {
		return mapper.updateRegister(vo);
	}
	
	//반 리스트 검색	
	@Override
	public List<ClassVO> getClassList() {	
		return mapper.getClassList();
	}
	
	//수강신청 리스트 검색
	@Override
	public List<RegisterVO> getRegistertList(int s_id) {	
		return mapper.getRegisterList(s_id);
}

}
