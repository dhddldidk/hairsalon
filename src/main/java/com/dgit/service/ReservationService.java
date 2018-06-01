package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReservationVO;

public interface ReservationService {
	
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
}
