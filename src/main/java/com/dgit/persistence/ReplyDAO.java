package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;

public interface ReplyDAO {

	//댓글 페이징
	public List<ReplyVO> listReply(int rb_no, Criteria cri) throws Exception;
	
	//댓글 총 개수
	public int replyTotalCount(int rb_no) throws Exception;
	
	public void insertReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(int reply_no) throws Exception;
	
}
