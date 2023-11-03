package org.studentcrm.crm.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterVO {
   private int r_id;
   private int s_id;
   private String c_startdate;
   private String c_enddate;
   private String class_name;
}