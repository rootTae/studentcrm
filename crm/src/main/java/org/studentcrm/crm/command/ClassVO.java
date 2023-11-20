package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ClassVO {

	String class_name;
	String classroom;
	String t_name;
	String c_period;
	String c_startdate;
	String c_enddate;
	String payment;
	String c_name;
	String s_list;
	String t_id;
}
