package com.dgit.persistence;

import java.util.List;
import java.util.Map;

import com.dgit.domain.ChartVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.ReservationVO;
import com.dgit.domain.SearchCriteria;

public interface ReservationDAO {

	//예약 일주일의 모든 리스트
	public List<ReservationVO> selectAllReservation(String res_start, String res_end) throws Exception;
	
	//관리자 예약 일주일의 모든 리스트
	public List<ReservationVO> selectAllReservationAdmin(String res_start, String res_end) throws Exception;
	
	public void insertReservation(ReservationVO vo) throws Exception;
	
	//예약내역
	public List<ReservationVO> myPageReservation(String u_id) throws Exception;
	
	//예약내역 페이징
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
	public void updateNoshow(boolean res_usage, int res_no) throws Exception;
	
	//관리자 예약현황 모든회원 리스트
	public List<ReservationVO> selectAllMemberList(Criteria cri) throws Exception;
	
	//모든회원 수 
	public int numberOfTotalMember() throws Exception;
}
