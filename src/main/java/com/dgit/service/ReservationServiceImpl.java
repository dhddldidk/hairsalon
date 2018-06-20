package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ChartVO;
import com.dgit.domain.Criteria;
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
	public void myPageDeleteReg(int res_no) throws Exception {
		
		dao.myPageDeleteReg(res_no);
		
	}

	@Override
	public List<ReservationVO> myPageListCriteria(String u_id, Criteria cri) throws Exception {
		
		return dao.myPageListCriteria(u_id, cri);
	}

	@Override
	public int myPageTotalCount(String u_id) throws Exception {
		
		return dao.myPageTotalCount(u_id);
	}

	@Override
	public List<ReservationVO> beforeMyPageListCriteria(String u_id, Criteria cri) throws Exception {
		
		return dao.beforeMyPageListCriteria(u_id, cri);
	}

	@Override
	public int beforeMyPageTotalCount(String u_id) throws Exception {
		
		return dao.beforeMyPageTotalCount(u_id);
	}

	@Override
	public List<ReservationVO> todayReservation() throws Exception {
		
		return dao.todayReservation();
	}

	@Override
	public ChartVO monthlyChartByTime(String month) throws Exception {
		
		return dao.monthlyChartByTime(month);
	}

	@Override
	public void updateNoshow(boolean res_usage,int res_no) throws Exception {
		dao.updateNoshow(res_usage,res_no);
		
	}

	@Override
	public List<ReservationVO> selectAllMemberList(Criteria cri) throws Exception {
		
		return dao.selectAllMemberList(cri);
	}

	@Override
	public int numberOfTotalMember() throws Exception {
		
		return dao.numberOfTotalMember();
	}

	@Override
	public List<ReservationVO> selectAllReservationAdmin(String res_start, String res_end) throws Exception {
		
		return dao.selectAllReservationAdmin(res_start, res_end);
	}

	

}
