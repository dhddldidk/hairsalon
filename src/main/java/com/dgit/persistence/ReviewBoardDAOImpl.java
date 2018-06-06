package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.ReviewBoardMapper"; 
	
	@Override
	public void insertReview(ReviewBoardVO vo) throws Exception {
		session.insert(namespace+".insertReview",vo);

	}

	@Override
	public List<ReviewBoardVO> selectAllReview() throws Exception {
		
		return session.selectList(namespace+".selectAllReview");
	}

	@Override
	public ReviewBoardVO readReview(int rb_no) throws Exception {
		
		return session.selectOne(namespace+".readReview", rb_no);
	}

	@Override
	public void deleteReview(int rb_no) throws Exception {
		session.delete(namespace+".deleteReview", rb_no);
	}

	@Override
	public void updateReview(ReviewBoardVO vo) throws Exception {
		session.update(namespace+".updateReview",vo);
		
	}

	@Override
	public List<ReviewBoardVO> listPage(int page) throws Exception {
		page = (page-1)*10;
		return session.selectList(namespace+".listPage", page);
	}

	@Override
	public List<ReviewBoardVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public List<ReviewBoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int totalCount() throws Exception {
		
		return session.selectOne(namespace+".totalCount");
	}

	@Override
	public int totalSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+".totalSearchCount",cri);
	}

}
