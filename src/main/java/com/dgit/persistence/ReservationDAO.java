package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReservationVO;

public interface ReservationDAO {

	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
}
