package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ReviewBoardVO;

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

}
