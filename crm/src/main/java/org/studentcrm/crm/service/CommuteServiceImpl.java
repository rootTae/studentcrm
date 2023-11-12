package org.studentcrm.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.studentcrm.crm.command.CommuteVO;
import org.studentcrm.crm.mapper.CommuteMapper;

import lombok.Setter;

@Service
public class CommuteServiceImpl implements CommuteService {
	@Setter(onMethod_ = {@Autowired})
	CommuteMapper cMapper;
	
	@Override
	public CommuteVO getCommute(int s_id) {
		return cMapper.getCommute(s_id);
	}

	@Override
	public int insertCommute(CommuteVO vo) {
		return cMapper.insertCommute(vo);
	}

	@Override
	public int updateCommute(CommuteVO vo) {
		return cMapper.updateCommute(vo);
	}

	@Override
	public int deleteCommute(int s_id) {
		return cMapper.deleteCommute(s_id);
	}

}
