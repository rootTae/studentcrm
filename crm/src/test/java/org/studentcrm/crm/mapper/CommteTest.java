package org.studentcrm.crm.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.studentcrm.crm.command.CommuteVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class CommteTest {
	@Setter(onMethod_ = {@Autowired})
	private CommuteMapper commapper;
	
	@Test
	public void comMapper() {
		log.info(commapper);
	}
	
	@Test
	public void insert() {
		CommuteVO vo = new CommuteVO();
		vo.setS_id(3);
		vo.setZip_code("12345");
		vo.setAddress1("서울시 강남구 대치동");
		vo.setAddress2("개나리 아파트");
		vo.setLocation("개나리 아파트 입구");
		commapper.insertCommute(vo);
	}
	
	@Test
	public void select() {
		log.info(commapper.getCommute(2));
	}
	
	@Test
	public void update() {
		CommuteVO vo = new CommuteVO();
		vo.setS_id(4);
		vo.setZip_code("11111");
		vo.setAddress1("서울시 강남구 대치동");
		vo.setAddress2("e편한세상 아파트");
		vo.setLocation("e편한세상 아파트 후문 입구");
		commapper.updateCommute(vo);
		log.info(vo);
	}
	
	@Test
	public void delete() {
		commapper.deleteCommute(3);
	}
}
