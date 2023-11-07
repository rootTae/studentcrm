package org.studentcrm.crm.mapper;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Repository;
import org.studentcrm.crm.command.AttendanceVO;
import org.studentcrm.crm.command.StudentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class AttendanceTest {
	
	@Setter(onMethod_ = {@Autowired})
	private AttendanceMapper mapper;
	
	@Test
    public void read() {
		int num = 3;
    	log.info(mapper.read(num));
    	mapper.read(num);
    }
	
	@Test
    public void insertMemo() {
        Timestamp timestampFromDB = new Timestamp(System.currentTimeMillis());

		AttendanceVO attendance = new AttendanceVO();
		attendance.setS_id(5);
		attendance.setA_date(timestampFromDB);
		attendance.setA_comment("ugly_day");
		mapper.insertMemo(attendance);
    }
	
	@Test
	public void readMemo() {
		AttendanceVO attendance = new AttendanceVO();
		attendance.setS_id(4); // 읽고자 하는 학생의 ID
		int num = 4;
		Timestamp timestampFromDB = getTime(num).get(1);

		attendance.setA_date(timestampFromDB);
		AttendanceVO memo = mapper.readMemo(attendance);

		if (memo != null) {
			String memoText = memo.getA_comment();
			Timestamp memoDate = memo.getA_date();
			log.info("메모 내용: " + memoText);
			log.info("메모 날짜: " + memoDate);
		} else {
			log.info("해당 메모가 존재하지 않습니다.");
		}
	}
	
	@Test
    public void updateStatus() {
	   AttendanceVO vo = new AttendanceVO();
	   int num = 4; // 출결 상태를 업데이트할 학생의 ID
	   vo.setS_id(num);
	   Timestamp time = getTime(num).get(1);
	   log.info(time);
	   vo.setA_date(time);
	   vo.setA_status("super late");
	   
	   log.info(mapper.updateStatus(vo));
    }

	private List<Timestamp> getTime(int s_id) {
		AttendanceVO vo = new AttendanceVO();
		vo.setS_id(s_id);
		return mapper.getTime(vo);
	}
	
	
	@Test
	public void getTimeTest() {
		
		log.info(getTime(4));
	}
}

