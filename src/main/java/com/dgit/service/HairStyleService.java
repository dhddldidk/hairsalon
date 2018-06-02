package com.dgit.service;

import java.util.List;

import com.dgit.domain.HairStyleVO;

public interface HairStyleService {

	public List<HairStyleVO> selectHairStyle() throws Exception;
}
