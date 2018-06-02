package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReviewBoardVO;

public interface ReviewBoardService {

	public void insertReview(ReviewBoardVO vo) throws Exception;
	
	public List<ReviewBoardVO> selectAllReview() throws Exception;
}
