package org.studentcrm.crm.mapper;

import org.studentcrm.crm.command.TeacherVO;

public interface RegistMapper {

	public int regist(TeacherVO vo);
	public int update(TeacherVO vo);
	public int login(String t_loginid);
	public int idCheck(String t_loginid);
	public void delete(String t_loginid);
}