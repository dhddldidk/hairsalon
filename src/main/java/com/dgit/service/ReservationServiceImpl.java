package com.dgit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ReservationVO;
import com.dgit.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;
	
	@Override
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception {
		
		return dao.selectAllReservation(res_start, res_end);
	}

	@Override
	public void insertReservation(ReservationVO vo) throws Exception {
		dao.insertReservation(vo);
		
	}

	@Override
	public List<ReservationVO> myPageReservation(String u_id) throws Exception {
		
		return dao.myPageReservation(u_id);
	}

	@Override
	public void myPageDeleteReg(String u_id, int res_no) throws Exception {
		
		dao.myPageDeleteReg(u_id, res_no);
		
	}

}
