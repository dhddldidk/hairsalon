package com.dgit.service;

import java.util.List;

import com.dgit.domain.ChartVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.ReservationVO;

public interface ReservationService {
	
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
	
	public void insertReservation(ReservationVO vo) throws Exception;
	
	//마이페이지
	public List<ReservationVO> myPageReservation(String u_id) throws Exception;
	
	//마이페이지 페이징
	public List<ReservationVO> myPageListCriteria(String u_id, Criteria cri) throws Exception;
	public int myPageTotalCount(String u_id) throws Exception;
	
	public void myPageDeleteReg(int res_no) throws Exception;
	
	//이전 예약내역 페이징
	public List<ReservationVO> beforeMyPageListCriteria(String u_id, Criteria cri) throws Exception;
	public int beforeMyPageTotalCount(String u_id) throws Exception;
	
	//관리자 오늘의 예약현황
	public List<ReservationVO> todayReservation() throws Exception;
	
	//관리자 시간별 월 매출 현황
	public ChartVO monthlyChartByTime(String month) throws Exception;
	
	//관리자 예약현황 체크박스 noshow
	public void updateNoshow(boolean res_usage,int res_no) throws Exception;
}
