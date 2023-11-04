package org.studentcrm.crm.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class StudentTest {
	@Autowired
	private StudentMapper mapper;
	
	@Test
	public void testmapper() {
		log.info(mapper);
	}
}
