package org.studentcrm.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.studentcrm.crm.command.ImageAttachVO;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.mapper.ImageAttachMapper;
import org.studentcrm.crm.mapper.StudentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class StudentServiceimpl implements StudentService {
	@Setter(onMethod_ = {@Autowired})
	StudentMapper sMapper;
	
	@Setter(onMethod_ = {@Autowired})
	ImageAttachMapper iMapper;
	
	@Override
	public StudentVO getStudent(int s_id) {
		return sMapper.getStudent(s_id);
	}
	
	@Transactional
	@Override
	public int insertStudent(StudentVO vo) {
		int result = sMapper.insertStudent(vo);
		
		//System.out.println("s_id : "+sMapper.getLastId());
		int lastSid = sMapper.getLastId();
		if(vo.getAttachImg() == null) {
			return 1;
		}
		System.out.println("첨부한 이미지의 정보!!! : "+vo.getAttachImg());
		vo.getAttachImg().setS_id(lastSid);
		
		iMapper.insert(vo.getAttachImg());
		
		return result;
	}
	
	@Transactional
	@Override
	public int updateStudent(StudentVO vo) {
		System.out.println("수정 서비스");
		//첨부파일 삭제 후 새로운 첨부파일 등록
		iMapper.deleteDB(vo.getS_id());
		
		int result = sMapper.updateStudent(vo);
		
		if(result > 0 && vo.getAttachImg() != null) {
			System.out.println("학생 업데이트 성공했고 첨부파일도 있음");
			vo.getAttachImg().setS_id(vo.getS_id());
			iMapper.insert(vo.getAttachImg());
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int deleteStudent(int s_id) {
		log.info("remove : "+s_id);
		iMapper.deleteDB(s_id);//첨부파일 먼저 삭제
		
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
	
	@Override
	public ImageAttachVO getAttachImg(int s_id) {
		return iMapper.findBySid(s_id);
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
