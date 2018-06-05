package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReservationVO;

public interface ReservationService {
	
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
	
	public void insertReservation(ReservationVO vo) throws Exception;
	
	public List<ReservationVO> myPageReservation(String u_id) throws Exception;
	
	public void myPageDeleteReg(String u_id, int res_no) throws Exception;
}
