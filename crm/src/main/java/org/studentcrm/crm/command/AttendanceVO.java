package org.studentcrm.crm.command;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceVO {
	
	String a_status;
	String a_comment;
	LocalDate a_date;
	String class_name;
	
	int s_id;
	
}
