package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ReservationVO;
import com.dgit.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO dao;
	
	@Override
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception {
		
		return dao.selectAllReservation(res_start, res_end);
	}

}
