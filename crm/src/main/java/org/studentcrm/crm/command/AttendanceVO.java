package org.studentcrm.crm.command;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceVO {
	
	private String a_status;
	private String a_comment;
	private String a_date;
	private String class_name;
	private int s_id;
	private int count;
	
	private String firstDayOfMonth;
	private String lastDayOfMonth;
	
	/*
	 * LocalDate month = LocalDate.now(); // 현재 월을 사용 LocalDate firstDayOfMonth =
	 * month.withDayOfMonth(1); LocalDate lastDayOfMonth =
	 * month.withDayOfMonth(month.lengthOfMonth());
	 */
    
    
}
