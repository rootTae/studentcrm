package org.studentcrm.crm.command;

import java.sql.Timestamp;
import java.time.LocalDate;

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
