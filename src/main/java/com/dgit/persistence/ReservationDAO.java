package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReservationVO;

public interface ReservationDAO {

	public List<ReservationVO> selectAllReservation() throws Exception;
}
