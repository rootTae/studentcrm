package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class TeacherVO {
	private int t_id;
	private String t_loginid;
	private String t_name;
	private String t_subject;
	private String t_class;
	private String t_pw;
	private String t_phone;
	private String t_email;
	private int consult_id;
   
   //첨부 파일 관련 멤버
   private TeacherImageAttachVO attachImg; 
}