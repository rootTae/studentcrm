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
   public StudentVO read(int s_id); //read student's school name and phone number, 학생 학교, 전번 불러오기
   public List<StudentVO> s_listByClass(String class_name); //get the list of students by the name of each class, 반이름으로 학생들 목록 리스트로 불러오기
   public List<ClassVO> classListByTeacher(int t_id); //get the list of classes by the teacher's id, 선생님 id로 담당 반 리스트 불러오기
   
   public AttendanceVO readForUpdate(AttendanceVO vo); //to read and show the student's attendance status each day, 학생의 매일의 출결상태를 읽어옴
   public boolean insertStatus(AttendanceVO vo); //initially update for the student's attendance status, 최초 학생의 출결 상태 저장 
   public boolean updateStatus(AttendanceVO vo); //update student's attendance status(attend, late, absent, leave early), 출석, 지각, 결석 상태로 수정
   
   public int insertMemo(AttendanceVO vo); //날짜별 메모 추가
   public AttendanceVO readMemo(AttendanceVO vo);//날짜별 메모 읽기
   
   public List<LocalDate> getTime(AttendanceVO vo);//행복한 timestamp 시간 불러오기
   
   public List<AttendanceVO> getMonthlyAttendance(AttendanceVO vo); //get monthly attendance status for each student(attend: 20, late:5,...), 월별 출결 상태를 카테고리로 정리(출석:20, 지각:5, ...)
}
