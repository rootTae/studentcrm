package org.studentcrm.crm.command;

import lombok.Data;

@Data
public class ImageAttachVO {
	private int s_id;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
}
