package org.studentcrm.crm.command;

import lombok.Data;

@Data
public class TeacherImageAttachVO {
	private int t_id;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
}
