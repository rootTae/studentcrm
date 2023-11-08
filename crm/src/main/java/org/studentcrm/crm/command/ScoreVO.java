package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class ScoreVO {
	
	private Exam_ScoreVO esvo;
	
	private double alltotal; //전체 합산점수
	
	private double korScore; //국어 점수
	private double engScore;//영어 점수
	private double mathScore;//수학 점수
	
	private double avgScore; //국영수 평균 점수
	
	private double totalAvgScore; //전체 국영수 평균점수
	
	private double korAvg;//전체 국어 평균점수
	private double engAvg;//전체 영어 평균점수
	private double mathAvg;//전체 수학 평균점수
	
	private double examPercentage; //시험백분율

	
	public ScoreVO(Exam_ScoreVO esvo) {
		this.esvo = esvo;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
		this.avgScore = this.avgScore = (this.engScore + this.korScore + this.mathScore)/3;
		this.totalAvgScore = this.totalAvgScore = (this.engAvg + this.korAvg + this.mathAvg)/3;
		this.korAvg = korAvg;
		this.engAvg = engAvg;
		this.mathAvg = mathAvg;
		this.alltotal = alltotal;
		this.examPercentage = examPercentage;
	}


	public Exam_ScoreVO getEsvo() {
		return esvo;
	}


	public void setEsvo(Exam_ScoreVO esvo) {
		this.esvo = esvo;
	}


	public double getAlltotal() {
		return alltotal;
	}


	public void setAlltotal(double alltotal) {
		this.alltotal = alltotal;
	}


	public double getKorScore() {
		return korScore;
	}


	public void setKorScore(double korScore) {
		this.korScore = korScore;
	}


	public double getEngScore() {
		return engScore;
	}


	public void setEngScore(double engScore) {
		this.engScore = engScore;
	}


	public double getMathScore() {
		return mathScore;
	}


	public void setMathScore(double mathScore) {
		this.mathScore = mathScore;
	}


	public double getAvgScore() {
		return avgScore;
	}


	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}


	public double getTotalAvgScore() {
		return totalAvgScore;
	}


	public void setTotalAvgScore(double totalAvgScore) {
		this.totalAvgScore = totalAvgScore;
	}


	public double getKorAvg() {
		return korAvg;
	}


	public void setKorAvg(double korAvg) {
		this.korAvg = korAvg;
	}


	public double getEngAvg() {
		return engAvg;
	}


	public void setEngAvg(double engAvg) {
		this.engAvg = engAvg;
	}


	public double getMathAvg() {
		return mathAvg;
	}


	public void setMathAvg(double mathAvg) {
		this.mathAvg = mathAvg;
	}


	public double getExamPercentage() {
		return examPercentage;
	}


	public void setExamPercentage(double examPercentage) {
		this.examPercentage = examPercentage;
	}


	@Override
	public String toString() {
		return "AvgVO [esvo=" + esvo + ", alltotal=" + alltotal + ", korScore=" + korScore + ", engScore=" + engScore
				+ ", mathScore=" + mathScore + ", avgScore=" + avgScore + ", totalAvgScore=" + totalAvgScore
				+ ", korAvg=" + korAvg + ", engAvg=" + engAvg + ", mathAvg=" + mathAvg + ", examPercentage="
				+ examPercentage + "]";
	}

	

	
	
	
	
}
