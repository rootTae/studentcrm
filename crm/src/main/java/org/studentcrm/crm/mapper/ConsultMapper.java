package org.studentcrm.crm.mapper;

import org.studentcrm.crm.command.ConsultVO;

public interface ConsultMapper {

	public boolean insertConsult(ConsultVO vo);
	
	public ConsultVO showConsultByDateAndS_id(ConsultVO vo);
	public ConsultVO showConsultByT_id(int t_id);
	
	public boolean updateConsult(ConsultVO vo);
	public boolean deleteConsult(int consult_id);
	
}
