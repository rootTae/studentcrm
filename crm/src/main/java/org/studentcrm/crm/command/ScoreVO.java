package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScoreVO {	
	//시험에 대한 정보
	private int e_id;
	private String e_name;
	private LocalDate e_date;
	
	//평균	
	private double korAvg;//전체 국어 평균점수
	private double engAvg;//전체 영어 평균점수
	private double mathAvg;//전체 수학 평균점수
	private double avgScore; //국영수 평균 점수
	private double totalAvgScore; //전체 국영수 평균점수
	
	private double alltotal; //전체 합산점수
}
