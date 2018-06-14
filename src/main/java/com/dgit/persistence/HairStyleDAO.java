package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.HairStyleVO;

public interface HairStyleDAO {

	//예약페이지 select박스
	public List<HairStyleVO> selectHairStyle() throws Exception;
	
	//헤어스타일 등록
	public void insertHairStyle(HairStyleVO vo) throws Exception;
	public void addHairAttach(String hair_filename) throws Exception;
	
	//헤어스타일 모든 정보
	public List<HairStyleVO> selectAllHairInfo() throws Exception;
}
