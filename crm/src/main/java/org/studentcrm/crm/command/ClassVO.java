package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
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
	int t_id;
}
