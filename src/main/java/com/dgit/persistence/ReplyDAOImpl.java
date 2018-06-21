package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> listReply(int rb_no, Criteria cri) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("rb_no", rb_no);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		return session.selectList(namespace+".listReply", map);
	}

	@Override
	public void insertReply(ReplyVO vo) throws Exception {
		session.insert(namespace+".insertReply", vo);

	}

	@Override
	public int replyTotalCount(int rb_no) throws Exception {
		
		return session.selectOne(namespace+".replyTotalCount", rb_no);
	}

	@Override
	public void deleteReply(int reply_no) throws Exception {
		session.delete(namespace+".deleteReply", reply_no);
		
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		session.update(namespace+".updateReply", vo);
		
	}

	@Override
	public int getRbno(int reply_no) throws Exception {
		return session.selectOne(namespace+".getRbno", reply_no);
		
	}

}
