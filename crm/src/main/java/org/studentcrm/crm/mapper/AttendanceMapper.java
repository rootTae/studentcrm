package org.studentcrm.crm.mapper;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.message.Message;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.ClassVO;
import org.studentcrm.crm.command.StudentVO;

@Mapper
@Repository
public interface AttendanceMapper {
   public StudentVO read(int s_id); //학생 반, 전번 불러오기
   public List<StudentVO> s_listByClass(String class_name); //반이름으로 애들 목록+정보 불러오기
   public List<ClassVO> classListByTeacher(int t_id);
   
   public AttendanceVO readForUpdate(AttendanceVO vo); // for updatestat, select vo
   public boolean insertStatus(AttendanceVO vo); // initially update for the student's status
   public boolean updateStatus(AttendanceVO vo); //출석, 지각, 결석...
   
   public int insertMemo(AttendanceVO vo); //날짜별 메모 추가
   public AttendanceVO readMemo(AttendanceVO vo);//날짜별 메모 읽기
   
   public List<LocalDate> getTime(AttendanceVO vo);//행복한 timestamp 시간 불러오기
   
   public List<AttendanceVO> getMonthlyAttendance(AttendanceVO vo);
}

// 메모를 읽으려면..해당 학생의 s_id에서 해당 날짜에 적힌 메모를 읽어야 하고, 입력도 마찬가지..