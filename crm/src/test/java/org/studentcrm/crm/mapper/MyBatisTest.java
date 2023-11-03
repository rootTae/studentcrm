package org.studentcrm.crm.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.studentcrm.crm.command.StudentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
@AutoConfigureTestDatabase(replace=AutoConfigureTestDatabase.Replace.NONE)
public class MyBatisTest {
	
	@Setter(onMethod_ = {@Autowired})
	private AttendanceMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void read() {
		int targetNum = 5;
		StudentVO vo = mapper.read(targetNum);
		log.info(vo);
	}
	
}
