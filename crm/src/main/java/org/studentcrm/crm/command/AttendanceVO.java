package org.studentcrm.crm.command;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceVO {
	
	String a_status;
	String a_comment;
	LocalDate a_date;
	String class_name;
	int s_id;
	
	LocalDate month = LocalDate.now(); // 현재 월을 사용
    LocalDate firstDayOfMonth = month.withDayOfMonth(1);
    LocalDate lastDayOfMonth = month.withDayOfMonth(month.lengthOfMonth());
    
    @Override
    public String toString() {
        return "AttendanceVO{" +
                "s_id=" + s_id +
                ", firstDayOfMonth=" + firstDayOfMonth +
                ", lastDayOfMonth=" + lastDayOfMonth +
                '}';
    }
}
