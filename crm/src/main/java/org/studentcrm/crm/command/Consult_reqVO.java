package org.studentcrm.crm.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Consult_reqVO {
	private String s_name;
	private Timestamp request_date;
	private String title;
	private Timestamp due_date;
	private int s_id;
	private int consult_id;
}
