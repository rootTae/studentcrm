package org.studentcrm.crm.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TestVO {
	private String test_name;
	private String s_name;
	private String kor_score;
	private String eng_score;
	private String math_score;
	private int s_id;
}
