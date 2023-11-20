package org.studentcrm.crm.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.RegisterVO;

@Repository
@Mapper
public interface RegisterService {

	public int rRegister(RegisterVO vo); //점수 입력
	public int rModify(RegisterVO vo); //점수 수정
	public int rRemove(int r_id); //점수 삭제
	
	public List<RegisterVO> getRegistertList(int s_id);//학번으로 알아오기
	public List<ClassVO> getClassList(); //반 이름으로 class검색

	
	
	

}
