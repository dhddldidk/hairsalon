package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.HairStyleVO;
import com.dgit.persistence.HairStyleDAO;

@Service
public class HairStyleServiceImpl implements HairStyleService {

	@Autowired
	HairStyleDAO dao;
	
	@Override
	public List<HairStyleVO> selectHairStyle() throws Exception {
		
		return dao.selectHairStyle();
	}

}
