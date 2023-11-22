package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class P_InformationVO {
	private int p_id;
	private String payment;
	private LocalDate p_date;
	private LocalDate c_startdate;
	private LocalDate c_enddate;
	private String p_form;
	private String p_receipt;
	private String p_status;
	
	private String startDate;
	private String endDate;
	
	
	private int r_id;
	
	private int s_id;
	private String s_name;
	
	private String class_name;
	
}
