package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.ReservationVO;

public interface ReservationDAO {

	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
	
	public void insertReservation(ReservationVO vo) throws Exception;
	
	//예약내역
	public List<ReservationVO> myPageReservation(String u_id) throws Exception;
	
	//예약내역 페이징
	public List<ReservationVO> myPageListCriteria(String u_id, Criteria cri) throws Exception;
	public int myPageTotalCount(String u_id, Criteria cri) throws Exception;
	
	public void myPageDeleteReg(String u_id, int res_no) throws Exception;
}
