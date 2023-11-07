package org.studentcrm.crm.mapper;

import java.util.List;

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
	private StudentMapper mapper;
	
	@Test
	public void testmapper() {
		log.info(mapper);
	}
	
	@Test
	public void insert() {
		for(int i=1; i<=5; i++) {
			StudentVO vo = new StudentVO();
			vo.setS_name("김학생");
			vo.setS_school("세모중학교");
			vo.setS_grade("2학년");
			vo.setS_birth("2009-10-22");
			vo.setS_gender("여");
			vo.setS_family("김아빠");
			vo.setS_relation("부");
			mapper.insertStudent(vo);
//			log.info(vo);
		}
	}
	
	@Test
	public void select() {
		StudentVO vo = mapper.getStudent(4);
		log.info(vo);
	}
	
	@Test
	public void delete() {
		mapper.deleteStudent(6);
	}
	
	@Test
	public void update() {		
		StudentVO vo = mapper.getStudent(2);
		vo.setS_name("이학생");
		vo.setS_school("동그라미고등학교");
		vo.setS_grade("1학년");
		vo.setS_birth("2006-11-02");
		vo.setS_gender("남");
		vo.setS_family("최엄마");
		vo.setS_relation("모");
		log.info(vo);
		mapper.updateStudent(vo);
	}
	
	@Test
	public void getName() {
		List<StudentVO> list = mapper.getStudentName("김학생");
		log.info(list);
	}
}
