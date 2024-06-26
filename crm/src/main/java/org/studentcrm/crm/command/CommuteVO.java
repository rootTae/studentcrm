package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommuteVO {
	private int s_id;
	private String zip_code;
	private String address1;
	private String address2;
	private String location;
}
