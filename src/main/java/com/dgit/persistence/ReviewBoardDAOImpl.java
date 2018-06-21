package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void updateReviewViewCnt(int rb_no) throws Exception {
		session.update(namespace+".updateReviewViewCnt", rb_no);
		
	}

	@Override
	public void addAttach(String att_filename) throws Exception {
		session.insert(namespace+".addAttach", att_filename);
		
	}

	@Override
	public List<String> getAttach(int rb_no) throws Exception {
		
		return session.selectList(namespace+".getAttach", rb_no);
	}

	@Override
	public void deleteAttach(int rb_no, String att_filename) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rb_no", rb_no);
		map.put("att_filename", att_filename);
		session.delete(namespace+".deleteAttach", map);
	}

	@Override
	public void replaceAttach(String att_filename, int rb_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rb_no", rb_no);
		map.put("att_filename", att_filename);
		session.insert(namespace+".replaceAttach", map);
	}

	@Override
	public void updateReplyCnt(int rb_no, int amount) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rb_no", rb_no);
		map.put("amount", amount);
		session.update(namespace+".updateReplyCnt", map);
	}

	@Override
	public List<ReviewBoardVO> selectMainReview() throws Exception {
		
		return session.selectList(namespace+".selectMainReview");
	}

}
