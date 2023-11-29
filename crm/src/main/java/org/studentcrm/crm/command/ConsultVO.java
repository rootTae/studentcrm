package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConsultVO {
   private int consult_id;
   private int t_id;
   private int s_id;
   
   //상담 기준일 설정
   private String consult_firstDay;
   private String consult_lastDay;
   
   private String consult_date;
   private String consult_title;
   private String consult_content;
   
   // join
   private String t_name;
   private String s_name;
   private String s_gender;
   private String s_phone;
   private String s_school;
   private String s_grade;
   
}