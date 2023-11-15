package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentVO {	
   private int s_id;
   private String s_name;
   private String s_school;
   private String s_grade;
   private String s_birth;
   private String s_gender;
   private String s_phone;
   private String s_family;
   private String s_relation;  
   private String s_family_phone1;
   private String s_family_phone2;
   private String s_sibling;
   private String reg_date;
   private String first_date;
   private String s_filename;
   private String s_class;
   private String s_memo;
}