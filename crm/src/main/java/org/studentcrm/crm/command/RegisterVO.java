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
    
}