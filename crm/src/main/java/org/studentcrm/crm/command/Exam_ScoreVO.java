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
	private int e_id;
	private double e_score;
	private String e_name;
	private String e_subject;
	private LocalDate e_date;
}