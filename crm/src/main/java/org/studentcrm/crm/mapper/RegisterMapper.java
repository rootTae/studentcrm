package org.studentcrm.crm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.RegisterVO;


@Mapper
@Repository
public interface RegisterMapper {
	public int registerClass(RegisterVO vo); //수강 신청
	public int deleteRegister(int r_id);	 //수강 신청 삭제
	public int updateRegister(RegisterVO vo); //수강 신청 수정 	
	public List<RegisterVO> getRegisterList(int s_id);//학번으로 알아오기
	public List<ClassVO> getClassList(); 	
}
