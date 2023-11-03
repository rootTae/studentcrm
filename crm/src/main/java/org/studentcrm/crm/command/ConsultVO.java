package org.studentcrm.crm.command;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConsultVO {
	private int consult_id;
	private String cunsult_status;
	private String consultant;
	private String consult_subject;
	private String consult_content;
	private int s_id;
	
}
