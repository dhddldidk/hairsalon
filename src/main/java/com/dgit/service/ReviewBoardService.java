package com.dgit.service;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;

public interface ReviewBoardService {

	public void insertReview(ReviewBoardVO vo) throws Exception;
	
	public List<ReviewBoardVO> selectAllReview() throws Exception;
	
	public ReviewBoardVO readReview(int rb_no, boolean flag) throws Exception;
	
	public void deleteReview(int rb_no) throws Exception;
	
	//게시글 수정할 때 업로드 된 파일도 파일 이름 받아서 수정하도록
	public void updateReview(ReviewBoardVO vo, String[] att_filename) throws Exception;
	
	//페이징
	public List<ReviewBoardVO> listPage(int page) throws Exception;
	public List<ReviewBoardVO> listCriteria(Criteria cri) throws Exception;
	public int totalCount() throws Exception;
	
	//후기게시판 search부분
	public List<ReviewBoardVO> listSearch(SearchCriteria cri) throws Exception;
	public int totalSearchCount(SearchCriteria cri) throws Exception;
	
	//조회수 증가
	public void updateReviewViewCnt(int rb_no) throws Exception;
	
	//후기게시판 댓글 개수
	public void updateReplyCnt(int rb_no, int amount) throws Exception;
	
	//메인화면 최신 리뷰 4개
	public List<ReviewBoardVO> selectMainReview() throws Exception;
}
