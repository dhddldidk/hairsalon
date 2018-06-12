package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> listReply(int rb_no, Criteria cri) throws Exception;
	
	public int replyTotalCount(int rb_no) throws Exception;
	
	public void insertReply(ReplyVO vo) throws Exception;
	
}
