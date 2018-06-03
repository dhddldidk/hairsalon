package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReviewBoardVO;

public interface ReviewBoardDAO {

	public void insertReview(ReviewBoardVO vo) throws Exception;
	
	public List<ReviewBoardVO> selectAllReview() throws Exception;
}