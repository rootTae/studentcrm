package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.TeacherImageAttachVO;

@Mapper
@Repository
public interface TeacherImageAttachMapper {
	public void insert(TeacherImageAttachVO vo);//첨부파일 추가
	public void delete(String uuid);//첨부파일 삭제
	public TeacherImageAttachVO findByTid(int t_id); //첨부파일 읽어오기
	public void deleteDB(int t_id);//게시글 번호에 해당되는 파일 내역 삭제(DB에서 삭제)
}
