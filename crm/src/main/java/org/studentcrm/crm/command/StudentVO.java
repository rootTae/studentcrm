package org.studentcrm.crm.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentVO {
 
   private String s_name;
   private String s_birth;
   private String s_phone;
   private Timestamp reg_date;
   private Timestamp first_date;
   private String family;
   private String school;
   private String gender;
   private String address;
   private String filename;
}