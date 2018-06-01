package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReservationVO;

public interface ReservationService {
	
	public List<ReservationVO> selectAllReservation() throws Exception;
}
