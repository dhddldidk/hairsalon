package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.ReviewBoardDAO;

@Service
public class ReviewBoardServiceimpl implements ReviewBoardService {

	@Autowired
	private ReviewBoardDAO dao;
	
	@Transactional
	@Override
	public void insertReview(ReviewBoardVO vo) throws Exception {
		dao.insertReview(vo);

		if(vo.getFiles()==null){
			return;
		}
		for(String att_filename : vo.getFiles()){
			dao.addAttach(att_filename);
		}
	}

	@Override
	public List<ReviewBoardVO> selectAllReview() throws Exception {
		
		return dao.selectAllReview();
	}

	@Transactional
	@Override
	public ReviewBoardVO readReview(int rb_no, boolean flag) throws Exception {
		if(flag==true){
			dao.updateReviewViewCnt(rb_no);
		}
		
		ReviewBoardVO vo = dao.readReview(rb_no);
		List<String> files = dao.getAttach(rb_no);
		vo.setFiles(files.toArray(new String[files.size()]));
		return vo;
	}

	@Transactional
	@Override
	public void deleteReview(int rb_no) throws Exception {
		
		dao.deleteAttach(rb_no, null);
		dao.deleteReview(rb_no);
	}

	@Transactional
	@Override
	public void updateReview(ReviewBoardVO vo, String[] oldFiles) throws Exception {
		dao.updateReview(vo);
		
		//첨부파일 수정할 때 선택된 파일 지우기
		int rb_no = vo.getRb_no();
		if(oldFiles!=null){
			for(String deletedFile : oldFiles){
				dao.deleteAttach(rb_no, deletedFile);
			}
		}
		
		//첨부파일 새로 선택한거 업로드
		String[] files = vo.getFiles();
		
		if(files==null){
			return;
		}
		
		for(String att_filename : files){
			dao.replaceAttach(att_filename, rb_no);
		}
		
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

	@Override
	public void updateReviewViewCnt(int rb_no) throws Exception {
		dao.updateReviewViewCnt(rb_no);
		
	}

	@Override
	public void updateReplyCnt(int rb_no, int amount) throws Exception {
		dao.updateReplyCnt(rb_no, amount);
		
	}

}
