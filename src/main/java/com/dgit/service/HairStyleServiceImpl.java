package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public void insertHairStyle(HairStyleVO vo) throws Exception {
		dao.insertHairStyle(vo);
		
		if(vo.gethFiles()==null){
			return;
		}
		for(String hair_filename : vo.gethFiles()){
			dao.addHairAttach(hair_filename);
		}
	}

	@Override
	public List<HairStyleVO> selectAllHairInfo() throws Exception {
		
		return dao.selectAllHairInfo();
	}

	

}
