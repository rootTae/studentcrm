package org.studentcrm.crm.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.logging.log4j.message.Message;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.StudentVO;

@Mapper
@Repository
public interface AttendanceMapper {
   public StudentVO read(int s_id);
   public int updateStatus();
   public void insertMemo(AttendanceVO a_vo);
   public AttendanceVO readMemo(AttendanceVO a_vo);

}

// 메모를 읽으려면..해당 학생의 s_id에서 해당 날짜에 적힌 메모를 읽어야 하고, 입력도 마찬가지..