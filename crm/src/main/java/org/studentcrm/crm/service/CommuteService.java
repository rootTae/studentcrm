package org.studentcrm.crm.service;

import org.studentcrm.crm.command.CommuteVO;

public interface CommuteService {
	//동학 정보 가져오기
	public CommuteVO getCommute(int s_id);
	//동학 정보 등록
	public int insertCommute(CommuteVO vo);
	//통학 정보 수정
	public int updateCommute(CommuteVO vo);	
	//통학 정보 삭제
	public int deleteCommute(int s_id);
}
