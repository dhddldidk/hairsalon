package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
