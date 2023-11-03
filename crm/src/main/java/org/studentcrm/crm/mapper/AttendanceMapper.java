package org.studentcrm.crm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.StudentVO;

@Mapper
@Repository
public interface AttendanceMapper {
   public StudentVO read(int s_id);
   public int insertMemo(AttendanceVO vo);
   public 
}