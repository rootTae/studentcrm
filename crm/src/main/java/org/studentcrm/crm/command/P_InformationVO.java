package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class P_InformationVO {
	private int p_int;
	private String payment;
	private String p_estimated;
	private String p_cost;
	private String p_date;
	private String c_startdate;
	private String c_enddate;
	private String p_form;
	private String p_receipt;
	private int r_id;
}
