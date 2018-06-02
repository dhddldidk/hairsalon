package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ReviewBoardVO;

@Service
public class ReviewBoardServiceimpl implements ReviewBoardService {

	@Autowired
	ReviewBoardService service;
	
	@Override
	public void insertReview(ReviewBoardVO vo) throws Exception {
		service.insertReview(vo);

	}

	@Override
	public List<ReviewBoardVO> selectAllReview() throws Exception {
		
		return service.selectAllReview();
	}

}
