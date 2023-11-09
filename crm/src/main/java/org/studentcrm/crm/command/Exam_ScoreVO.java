package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exam_ScoreVO {
	
	private int score_id;
	private int s_id;
	private String s_name;
	private String s_grade;
	
	private int e_id;
	private String e_name;
	private LocalDate e_date;

	private double korScore;
	private double engScore;
	private double mathScore;
	private double avgScore;	
}
