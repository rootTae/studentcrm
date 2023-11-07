package org.studentcrm.crm.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceVO {
	String a_status;
	String a_comment;
	Timestamp a_date;
	int s_id;
	
}
