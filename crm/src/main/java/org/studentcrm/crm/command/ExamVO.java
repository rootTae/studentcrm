package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamVO {

	private int e_id;
	private String e_name;
	private String e_subject;
	private LocalDate e_date;
}
