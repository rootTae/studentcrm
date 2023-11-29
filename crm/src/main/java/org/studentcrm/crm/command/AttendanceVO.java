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
	
	// 사용해야하는 값들
	private String a_status; //출결상태(attend, late,...)
	private String a_comment; //메모에 넣으려고 했던 것. 이번에 구현하지 않음.
	private String a_date; //attendance페이지에 관련된 날짜
	private String class_name; //반의 이름(eng101등)
	private int s_id; // student table의 s_id(primary key)
	private int count; // 쓰지 않음
	
	
	// DB엔 쓰지 않지만, DTO로 씀
	private String firstDayOfMonth;
	private String lastDayOfMonth;
	
	/*
	 * LocalDate month = LocalDate.now(); // 현재 월을 사용 LocalDate firstDayOfMonth =
	 * month.withDayOfMonth(1); LocalDate lastDayOfMonth =
	 * month.withDayOfMonth(month.lengthOfMonth());
	 */
    
    
}
