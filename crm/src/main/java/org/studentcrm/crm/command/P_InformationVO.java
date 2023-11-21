package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class P_InformationVO {
	private int p_int;
	private String payment;
	private String p_date;
	private LocalDate c_startdate;
	private LocalDate c_enddate;
	private String p_form;
	private String p_receipt;
	
	private LocalDate startDate;
	private LocalDate endDate;
	
	
	private int r_id;
	
	private int s_id;
	private String s_name;
	
	
}
