package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassVO {

	String class_name;
	String classroom;
	String teacher_name;
	String c_period;
	String c_startdate;
	String c_enddate;
	String payment;
	String c_name;
	String s_list;
	String t_id;
}
