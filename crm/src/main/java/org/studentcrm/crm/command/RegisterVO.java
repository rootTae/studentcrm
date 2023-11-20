package org.studentcrm.crm.command;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterVO {
   private int r_id;
   
   
   private int s_id;
   private String s_name;
   
   private String t_name;
   private String class_name;
   private LocalDate c_startdate;
   private LocalDate c_enddate;
   private String payment;
   private String classroom;
   private String c_period;
 

   
   //위는 테이블 컬럼
   
//   //아래는 다른 테이블(class) 조인해서 가져올 컬럼
//   //학급명
//   private String c_class;
//   //학생명단
//   private String s_list;
//   //담당 강사
//   private String t_name;
//   //강의실
//   private String classroom;
//   //시작일
//   private String c_startdate;
//   //종료일
//   private String c_enddate;
   
}