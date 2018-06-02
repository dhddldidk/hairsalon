package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.HairStyleVO;

public interface HairStyleDAO {

	public List<HairStyleVO> selectHairStyle() throws Exception;
}
