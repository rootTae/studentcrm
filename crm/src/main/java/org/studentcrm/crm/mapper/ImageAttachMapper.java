package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.ImageAttachVO;

@Mapper
@Repository
public interface ImageAttachMapper {
	public void insert(ImageAttachVO vo);//첨부파일 추가
	public void delete(String uuid);//첨부파일 삭제
	public ImageAttachVO findBySid(int s_id); //첨부파일 읽어오기
}
