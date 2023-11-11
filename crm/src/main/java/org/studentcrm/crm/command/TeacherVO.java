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
   int t_id;
   String t_loginid;
   String t_name;
   String t_subject;
   String t_class;
   String t_pw;
   String t_phone;
   String t_email;
}