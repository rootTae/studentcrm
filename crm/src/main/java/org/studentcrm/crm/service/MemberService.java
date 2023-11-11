package org.studentcrm.crm.service;

import org.studentcrm.crm.command.TeacherVO;

public interface MemberService {
	public int regist(TeacherVO vo);
	public int update(TeacherVO vo);
	public TeacherVO login(String t_loginid, String t_pw);
	public int idCheck(String t_loginid);
	public void delete(int t_id);
	public TeacherVO select(int t_id);
}
