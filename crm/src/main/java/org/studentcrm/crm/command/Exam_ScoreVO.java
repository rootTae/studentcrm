package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class Exam_ScoreVO {
	
	private int score_id;
	private int s_id;
	private int e_id;
	private double e_score;
	private String e_name;
	private String e_subject;
	private LocalDate e_date;
	private String e_type;
	private String s_grade;
	private int e_year;
	private int e_month;
	
	public Exam_ScoreVO() {
		this.score_id = score_id;
		this.s_id = s_id;
		this.e_id = e_id;
		this.e_score = e_score;
		this.e_name = e_name;
		this.e_subject = e_subject;
		this.e_date = e_date;
		this.e_type = e_year + e_month + s_grade +e_name; 
		this.s_grade = s_grade;
		this.e_year = e_year;
		this.e_month = e_month;
	}

	public int getScore_id() {
		return score_id;
	}

	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public double getE_score() {
		return e_score;
	}

	public void setE_score(double e_score) {
		this.e_score = e_score;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_subject() {
		return e_subject;
	}

	public void setE_subject(String e_subject) {
		this.e_subject = e_subject;
	}

	public LocalDate getE_date() {
		return e_date;
	}

	public void setE_date(LocalDate e_date) {
		this.e_date = e_date;
	}

	public String getE_type() {
		return e_type;
	}

	public void setE_type(String e_type) {
		this.e_type = e_type;
	}

	public String getS_grade() {
		return s_grade;
	}

	public void setS_grade(String s_grade) {
		this.s_grade = s_grade;
	}

	public int getE_year() {
		return e_year;
	}

	public void setE_year(int e_year) {
		this.e_year = e_year;
	}

	public int getE_month() {
		return e_month;
	}

	public void setE_month(int e_month) {
		this.e_month = e_month;
	}

	@Override
	public String toString() {
		return "Exam_ScoreVO [score_id=" + score_id + ", s_id=" + s_id + ", e_id=" + e_id + ", e_score=" + e_score
				+ ", e_name=" + e_name + ", e_subject=" + e_subject + ", e_date=" + e_date + ", e_type=" + e_type
				+ ", s_grade=" + s_grade + ", e_year=" + e_year + ", e_month=" + e_month + "]";
	}
	
	
	
	
}
