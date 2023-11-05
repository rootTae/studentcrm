package org.studentcrm.crm.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.studentcrm.crm.command.AvgVO;
import org.studentcrm.crm.command.Exam_ScoreVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class GradesMapperTest {

	@Setter(onMethod_ = {@Autowired})
	private GradesMapper mapper;
	
	@Test
	public void testmapper() {
		log.info(mapper);
	}
	
	@Test
	public void insertscore() {
	 Exam_ScoreVO vo = new Exam_ScoreVO();
	 vo.setS_id(4);
	 vo.setE_id(4);
	 vo.setScore_id(80);
	 mapper.insertScore(vo);
	}
	
	@Test
	public void deleteScore() {
		mapper.deleteScore(1);
	}
	
	@Test
	public void updateScore() {
		Exam_ScoreVO vo = new Exam_ScoreVO();
		vo.setE_score(90);
		vo.setScore_id(2);
		mapper.updateScore(vo);
		log.info(vo);
	}
	
	
	@Test
	public void getScoreList(){
		List<Exam_ScoreVO> list = mapper.geTotalScoreList();
		for (Exam_ScoreVO vo : list) log.info(vo.toString());
	}
	
	@Test
	public void avgScore() {
		 Exam_ScoreVO vo = new Exam_ScoreVO();
		 vo.setS_id(2);
		 vo.setE_name("시험");
		AvgVO avo=mapper.avgScore(vo);
		log.info(avo.toString());
	}
	
}
