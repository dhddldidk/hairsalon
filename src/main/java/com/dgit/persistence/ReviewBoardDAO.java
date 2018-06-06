package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;

public interface ReviewBoardDAO {

	public void insertReview(ReviewBoardVO vo) throws Exception;
	
	public List<ReviewBoardVO> selectAllReview() throws Exception;
	
	public ReviewBoardVO readReview(int rb_no) throws Exception;
	
	public void deleteReview(int rb_no) throws Exception;
	
	public void updateReview(ReviewBoardVO vo) throws Exception;
	
	//페이징
	public List<ReviewBoardVO> listPage(int page) throws Exception;
	public List<ReviewBoardVO> listCriteria(Criteria cri) throws Exception;
	public int totalCount() throws Exception;
	
	//후기게시판 search부분
	public List<ReviewBoardVO> listSearch(SearchCriteria cri) throws Exception;
	public int totalSearchCount(SearchCriteria cri) throws Exception;
}
