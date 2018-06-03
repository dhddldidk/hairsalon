package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ReviewBoardVO;
import com.dgit.persistence.ReviewBoardDAO;

@Service
public class ReviewBoardServiceimpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDAO dao;
	
	@Override
	public void insertReview(ReviewBoardVO vo) throws Exception {
		dao.insertReview(vo);

	}

	@Override
	public List<ReviewBoardVO> selectAllReview() throws Exception {
		
		return dao.selectAllReview();
	}

}