package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReviewBoardVO;

public interface ReviewBoardService {

	public void insertReview(ReviewBoardVO vo) throws Exception;
	
	public List<ReviewBoardVO> selectAllReview() throws Exception;
	
	public ReviewBoardVO readReview(int rb_no) throws Exception;
	
	public void deleteReview(int rb_no) throws Exception;
	
	public void updateReview(ReviewBoardVO vo) throws Exception;
}
