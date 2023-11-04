package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.CommuteVO;

@Mapper
@Repository
public interface CommuteMapper {
	//동학 정보 가져오기
	public CommuteVO getCommute(int s_id);
	//동학 정보 등록
	public void insertCommute(CommuteVO vo);
	//통학 정보 수정
	public boolean updateCommute(CommuteVO vo);	
	//통학 정보 삭제
	public void deleteCommute(int s_id);
}
