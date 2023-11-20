package org.studentcrm.crm.command;

import lombok.Data;

//레이어와 레이어 사이에서 데이터를 넘기기 위해 만든 파일
@Data
public class ImageAttachFileDTO {
	private String fileName; //파일 이름
	private String uploadPath; //업로드 경로
	private String uuid; //uuid
	private boolean image; //이미지 파일 여부
}
