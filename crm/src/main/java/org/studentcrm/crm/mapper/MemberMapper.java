package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.TeacherVO;

@Repository
@Mapper
public interface MemberMapper {

	public int regist(TeacherVO vo);
	public int update(TeacherVO vo);
	public TeacherVO login(String t_loginid, String t_pw);
	public int idCheck(String t_loginid);
	public void delete(int t_id);
	public TeacherVO select(int t_id);
}