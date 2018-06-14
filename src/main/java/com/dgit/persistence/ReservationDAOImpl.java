package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.ReservationMapper";
	
	@Override
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception {
		
		Map<String, String> map = new HashMap<>();
		map.put("res_start", res_start);
		map.put("res_end", res_end);
		return session.selectList(namespace+".selectAllReservation", map);
	}

	@Override
	public void insertReservation(ReservationVO vo) throws Exception {
		session.insert(namespace+".insertReservation",vo);
		
	}

	@Override
	public List<ReservationVO> myPageReservation(String u_id) throws Exception {
		
		return session.selectList(namespace+".myPageReservation",u_id);
	}

	@Override
	public void myPageDeleteReg(String u_id, int res_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("u_id", u_id);
		map.put("res_no", res_no);
		
		session.delete(namespace+".myPageDeleteReg",map);
	}

	@Override
	public List<ReservationVO> myPageListCriteria(String u_id, Criteria cri) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("u_id", u_id);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		return session.selectList(namespace+".myPageListCriteria", map);
	}

	@Override
	public int myPageTotalCount(String u_id) throws Exception {
		
		return session.selectOne(namespace+".myPageTotalCount", u_id);
	}

	@Override
	public List<ReservationVO> beforeMyPageListCriteria(String u_id, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("u_id", u_id);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		return session.selectList(namespace+".beforeMyPageListCriteria", map);
	}

	@Override
	public int beforeMyPageTotalCount(String u_id) throws Exception {
		
		return session.selectOne(namespace+".beforeMyPageTotalCount", u_id);
	}

}
