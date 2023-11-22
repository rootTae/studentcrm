/*
 * package org.studentcrm.crm.mapper;
 * 
 * import static org.junit.jupiter.api.Assertions.assertNotNull;
 * 
 * import java.time.LocalDate; import java.util.Date; import java.util.List;
 * import java.util.Map;
 * 
 * import org.junit.jupiter.api.Test; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.boot.test.context.SpringBootTest; import
 * org.springframework.http.HttpStatus; import
 * org.springframework.http.ResponseEntity; import
 * org.studentcrm.crm.command.AttendanceVO; import
 * org.studentcrm.crm.controller.AttendanceRestController;
 * 
 * import lombok.Setter; import lombok.extern.log4j.Log4j2;
 * 
 * @Log4j2
 * 
 * @SpringBootTest public class AttendanceTest {
 * 
 * @Setter(onMethod_ = {@Autowired}) private AttendanceMapper mapper;
 * 
 * @Autowired private AttendanceRestController controller;
 * 
 * @Test public void read() { int num = 3; log.info(mapper.read(num));
 * mapper.read(num); }
 * 
 * @Test public void insertMemo() { LocalDate DateFromDB = LocalDate.now();
 * 
 * AttendanceVO attendance = new AttendanceVO(); attendance.setS_id(5);
 * attendance.setA_date(DateFromDB); attendance.setA_comment("ugly_day");
 * mapper.insertMemo(attendance); }
 * 
 * @Test public void readMemo() { AttendanceVO attendance = new AttendanceVO();
 * attendance.setS_id(4); // 읽고자 하는 학생의 ID int num = 4; LocalDate DateFromDB =
 * LocalDate.now(); DateFromDB = getTime(num).get(1);
 * 
 * attendance.setA_date(DateFromDB); AttendanceVO memo =
 * mapper.readMemo(attendance);
 * 
 * if (memo != null) { String memoText = memo.getA_comment(); LocalDate memoDate
 * = memo.getA_date(); log.info("메모 내용: " + memoText); log.info("메모 날짜: " +
 * memoDate); } else { log.info("해당 메모가 존재하지 않습니다."); } }
 * 
 * @Test public void updateStatus() { AttendanceVO vo = new AttendanceVO(); int
 * num = 4; // 출결 상태를 업데이트할 학생의 ID vo.setS_id(num); LocalDate time =
 * getTime(num).get(0); log.info(time); vo.setA_date(time);
 * vo.setA_status("super late");
 * 
 * log.info(mapper.updateStatus(vo)); assertNotNull(mapper.updateStatus(vo)); }
 * 
 * private List<LocalDate> getTime(int s_id) { AttendanceVO vo = new
 * AttendanceVO(); vo.setS_id(s_id); return mapper.getTime(vo); }
 * 
 * 
 * @Test public void getTimeTest() {
 * 
 * log.info(getTime(2)); }
 * 
 * @Test public void testGetMonthlyAttendance() {
 * 
 * int s_id = 3; // 테스트용 학생 ID LocalDate month = LocalDate.now(); // 현재 월을 사용
 * LocalDate firstDayOfMonth = month.withDayOfMonth(1); LocalDate lastDayOfMonth
 * = month.withDayOfMonth(month.lengthOfMonth());
 * 
 * AttendanceVO attendanceVO = new AttendanceVO(); attendanceVO.setS_id(s_id);
 * attendanceVO.setFirstDayOfMonth(firstDayOfMonth);
 * attendanceVO.setLastDayOfMonth(lastDayOfMonth);
 * 
 * log.info(attendanceVO); System.out.println(s_id);
 * System.out.println(firstDayOfMonth); System.out.println(lastDayOfMonth);
 * List<AttendanceVO> stat = mapper.getMonthlyAttendance(attendanceVO);
 * 
 * if (stat != null && !stat.isEmpty()) { log.info(stat); } else {
 * log.info("조회 결과가 없습니다."); }
 * 
 * } }
 * 
 */