package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDAO;
import com.dgit.persistence.ReviewBoardDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDao;
	
	@Autowired
	private ReviewBoardDAO boardDao;

	@Override
	public List<ReplyVO> listReply(int rb_no, Criteria cri) throws Exception {
		
		return replyDao.listReply(rb_no, cri);
	}

	//게시판 댓글개수를 나타내기 위해
	@Transactional
	@Override
	public void insertReply(ReplyVO vo) throws Exception {
		replyDao.insertReply(vo);
		boardDao.updateReplyCnt(vo.getRb_no(), 1);
		
	}

	@Override
	public int replyTotalCount(int rb_no) throws Exception {
		
		return replyDao.replyTotalCount(rb_no);
	}

	@Override
	public void deleteReply(int reply_no) throws Exception {
		replyDao.deleteReply(reply_no);
		
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		replyDao.updateReply(vo);
		
	}
	
	
}
