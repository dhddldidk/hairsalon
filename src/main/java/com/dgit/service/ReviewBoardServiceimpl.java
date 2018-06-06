package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.ReviewBoardDAO;

@Service
public class ReviewBoardServiceimpl implements ReviewBoardService {

	@Autowired
	private ReviewBoardDAO dao;
	
	@Override
	public void insertReview(ReviewBoardVO vo) throws Exception {
		dao.insertReview(vo);

	}

	@Override
	public List<ReviewBoardVO> selectAllReview() throws Exception {
		
		return dao.selectAllReview();
	}

	@Override
	public ReviewBoardVO readReview(int rb_no) throws Exception {
		
		return dao.readReview(rb_no);
	}

	@Override
	public void deleteReview(int rb_no) throws Exception {
		dao.deleteReview(rb_no);
		
	}

	@Override
	public void updateReview(ReviewBoardVO vo) throws Exception {
		dao.updateReview(vo);
		
	}

	@Override
	public List<ReviewBoardVO> listPage(int page) throws Exception {
		
		return dao.listPage(page);
	}

	@Override
	public List<ReviewBoardVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public List<ReviewBoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int totalCount() throws Exception {
		
		return dao.totalCount();
	}

	@Override
	public int totalSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.totalSearchCount(cri);
	}

}
