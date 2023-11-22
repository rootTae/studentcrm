package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConsultVO {
	private int consult_id;
	private int t_id;
	private String t_name; //이용하는 것 없이 출력할 때 편의를 위해
	private int s_id;
	private String s_name; //이용하는 것 없이 출력할 때 편의를 위해
	
	private String consult_date;
	private String consult_content;
	
	
}
