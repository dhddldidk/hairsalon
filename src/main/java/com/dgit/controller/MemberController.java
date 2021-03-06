package com.dgit.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.ChartVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.LoginDTO;
import com.dgit.domain.MemberVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReservationVO;
import com.dgit.service.MemberService;
import com.dgit.service.ReservationService;

@RequestMapping("/member/")
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@Autowired
	ReservationService resService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입 
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet(){
		logger.info("register Get ......");
		
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPost(MemberVO vo, String u_phone, String u_email, String u_address) throws Exception{
		logger.info("register Post ......");
		logger.info(vo.toString());
		logger.info(u_phone+u_email+u_address);
		
		//회원가입 일
		Date date = new Date();
		vo.setU_regdate(date);
		logger.info("가입날짜"+vo.getU_regdate());
		   
		service.registerMember(vo);

		return "redirect:/user/login";  
	}
	
	//아이디 중복 조회
	@ResponseBody
	@RequestMapping(value="/chkDuplication", method=RequestMethod.GET)
	public ResponseEntity<String> chkDuplicationGet(String id){
		logger.info("chkDuplication Get ......");
		ResponseEntity<String> entity = null;
		logger.info("id : "+ id);
		try{
			
			String result = service.selectedById(id);
			
			if(result == null){
				result = "";
			}
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//마이페이지에서 예약내역 관리
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPageGet(Model model, HttpServletRequest request,@ModelAttribute("cri")Criteria cri) throws Exception{
		logger.info("myPage Get ......");
		
		HttpSession session = request.getSession();
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");
		
		List<ReservationVO> list = resService.myPageListCriteria(loginDTO.getU_id(), cri);
		
		//관리자 예약현황 리스트
		List<ReservationVO> todayReservation = resService.todayReservation();
		
		for(ReservationVO vo : todayReservation){
			logger.info("관리자 예약리스트 : "+vo.toString());
		}
		
		model.addAttribute("myList", list);
		model.addAttribute("todayReservation", todayReservation);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(resService.myPageTotalCount(loginDTO.getU_id()));
		logger.info("예약된 개수 : "+resService.myPageTotalCount(loginDTO.getU_id()));
		model.addAttribute("pageMaker", pageMaker);
		
		
	}
	
	//마이페이지에서 이전 예약내역 관리
		@RequestMapping(value="/beforeMyPage", method=RequestMethod.GET)
		public void beforeMyPageGet(Model model, HttpServletRequest request,@ModelAttribute("cri")Criteria cri) throws Exception{
			logger.info("myPage Get ......");
			
			HttpSession session = request.getSession();
			LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");
			
			//마이페이지에서 이전 예약내역 관리
			List<ReservationVO> joinList = resService.beforeMyPageListCriteria(loginDTO.getU_id(), cri);
			for(ReservationVO vo : joinList){
				logger.info("이전예약 : "+vo.toString());
			}
			List<ReservationVO> memberList = resService.selectAllMemberList(cri);
			
			model.addAttribute("joinList", joinList);
			model.addAttribute("memberList", memberList);
			
			PageMaker joinPageMaker = new PageMaker();
			joinPageMaker.setCri(cri);
			joinPageMaker.setTotalCount(resService.beforeMyPageTotalCount(loginDTO.getU_id()));
			model.addAttribute("joinPageMaker", joinPageMaker);
			
			PageMaker memberPageMaker = new PageMaker();
			memberPageMaker.setCri(cri);
			memberPageMaker.setTotalCount(resService.numberOfTotalMember());
			model.addAttribute("memberPageMaker",memberPageMaker);
			
		}
	
	//예약 취소
	@ResponseBody
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public ResponseEntity<List<ReservationVO>> myPagePost(HttpServletRequest request, int res_no, Model model) throws Exception{
		logger.info("myPage Post ......res_no"+res_no);
		ResponseEntity<List<ReservationVO>> entity = null;
		HttpSession session = request.getSession();
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("login");
		
		logger.info("loginDTO : "+loginDTO.getU_id());
		try{
			resService.myPageDeleteReg(res_no);
			List<ReservationVO> list = resService.myPageReservation(loginDTO.getU_id());
			
			
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	//차트 화면
		@RequestMapping(value="/myChart", method=RequestMethod.GET)
		public void myChartGet(Model model) throws Exception{
			logger.info("myChart Get ......");
			logger.info("시간별 월 매출현황 : ");
			List<ChartVO> chartVO = new ArrayList<>();
			for(int i=1; i<13; i++){
				if(i<10){
					logger.info("시간별 월 매출현황 : "+ resService.monthlyChartByTime("0"+i));
					ChartVO chart = resService.monthlyChartByTime("0"+i);
					chartVO.add(chart);
				}else if(i>9){
					logger.info("시간별 월 매출현황 : "+ resService.monthlyChartByTime(""+i));
					ChartVO chart = resService.monthlyChartByTime(""+i);
					chartVO.add(chart);
				}
			}
			model.addAttribute("chartVO", chartVO);
		}
		
		//noshow처리
		@ResponseBody
		@RequestMapping(value="/checkBoxFlag", method=RequestMethod.GET)
		public ResponseEntity<String> checkBoxFlagrGet(boolean flag, int res_no) throws Exception{
			logger.info("checkBoxFlag Get ......"+flag);
			logger.info("checkBoxFlag Get ......"+res_no);
			
			
			ResponseEntity<String> entity = null;
			try{
				resService.updateNoshow(flag, res_no);
				
				entity = new ResponseEntity<>("success", HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
}
