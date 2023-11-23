package org.studentcrm.crm.service;

import org.studentcrm.crm.command.TeacherImageAttachVO;
import org.studentcrm.crm.command.TeacherVO;

public interface MemberService {
	public int regist(TeacherVO vo);
	public int update(TeacherVO vo);
	public TeacherVO login(String t_loginid, String t_pw);
	public int idCheck(String t_loginid);
	public int delete(int t_id);
	public TeacherVO select(int t_id);
	
	//최근 추가된 t_id 가져오기
	public int getLastId();
	//이미지 첨부파일 가져오기
	public TeacherImageAttachVO getAttachImg(int t_id);
}
