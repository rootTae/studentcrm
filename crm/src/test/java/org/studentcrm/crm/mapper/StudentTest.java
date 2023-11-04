package org.studentcrm.crm.mapper;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.studentcrm.crm.command.StudentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class StudentTest {
	@Setter(onMethod_ = {@Autowired})
//	@Autowired
	private StudentMapper mapper;
	
	@Test
	public void testmapper() {
		log.info(mapper);
	}
	
//	StudentVO vo = null;
//	@BeforeEach
//	public void set() {
//		vo = new StudentVO();
//	}
	
	@Test
	public void insert(StudentVO vo) {
		for(int i=1; i<=10; i++) {
			vo = new StudentVO();
			vo.setS_name("김학생"+i);
			vo.setS_school("세모중학교");
			vo.setS_grade("2학년");
			vo.setS_birth("2009-10-22");
			vo.setS_gender("여");
			vo.setS_family("김아빠"+i);
			vo.setS_relation("부");
			mapper.insertStudent(vo);
			log.info(vo);
		}
	}
}
