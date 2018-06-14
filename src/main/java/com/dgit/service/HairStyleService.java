package com.dgit.service;

import java.util.List;

import com.dgit.domain.HairStyleVO;

public interface HairStyleService {

	public List<HairStyleVO> selectHairStyle() throws Exception;
	
	//헤어스타일 등록
	public void insertHairStyle(HairStyleVO vo) throws Exception;
	
	//헤어스타일 모든 정보
	public List<HairStyleVO> selectAllHairInfo() throws Exception;
	
	//헤어스타일 read
	public HairStyleVO readHairStyle(int hair_no) throws Exception;
	
	//헤어스타일 삭제
	public void deleteHairStyle(int hair_no) throws Exception;
	
	//헤어스타일 수정
	public void updateHairStyle(HairStyleVO vo, String[] oldFiles) throws Exception;
}
