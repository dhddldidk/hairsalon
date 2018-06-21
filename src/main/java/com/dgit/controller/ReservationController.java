package com.dgit.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.HairStyleVO;
import com.dgit.domain.LoginDTO;
import com.dgit.domain.MemberVO;
import com.dgit.domain.ReservationVO;
import com.dgit.service.HairStyleService;
import com.dgit.service.ReservationService;

@RequestMapping("/reservation/")
@Controller
public class ReservationController {

	@Autowired
	HairStyleService hairService;
	
	@Autowired
	ReservationService resService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public void reservationGet(Model model, HttpServletRequest request) throws Exception{
		logger.info("reservation Get ......");
		
		HttpSession session = request.getSession();
		LoginDTO loginDTO = (LoginDTO)session.getAttribute("login");
		
		
		logger.info("destt..........................."+session.getAttribute("dest"));
		
		//로그인을 하지 않았을 경우 
		//로그인을 하게 되면 예약페이지로 가도록 그 경로를 지정
		//(interceptor에 후기게시판 dest만 저장되어 있기 때문에)
		
		session.getAttribute("dest");
		session.setAttribute("dest", "/hairsalon/reservation/reservation");
		logger.info("destt..변경 후 ......................."+session.getAttribute("dest"));
		//select 박스
		List<HairStyleVO> hairList = hairService.selectHairStyle();
		
		for(HairStyleVO vo : hairList){
			logger.info("db에서 가져온 헤어시간"+vo.getHair_time());
		}
		
		model.addAttribute("hairList",hairList);
		
		
	}
	
	//테이블에서 예약하기를 눌렀을 때
	@RequestMapping(value="/reservation", method=RequestMethod.POST)
	public String reservationPost(ReservationVO vo, 
			String res_sDate, String res_eDate, String user_id, int hair_no) throws Exception{
		logger.info("reservationPost ......"+vo.toString());
		logger.info("user_id ......"+user_id);
		logger.info("sDate ......"+res_sDate);
		logger.info("eDate ......"+res_eDate);
		logger.info("hair_no ......"+hair_no);
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date startD = fm.parse(res_sDate);
		Date endD = fm.parse(res_eDate);
		vo.setRes_start(startD);
		vo.setRes_end(endD);
		
		vo.setMember(new MemberVO(user_id));
		
		vo.setHairstyleVo(new HairStyleVO(hair_no));
		resService.insertReservation(vo);
		
		return "redirect:/member/myPage";
	}
	
	//예약된 리스트들 가져와서 화면에 뿌려줌
	@ResponseBody
	@RequestMapping(value="/resAll", method=RequestMethod.GET)
	public ResponseEntity<List<ReservationVO>> resAll(String res_start, String res_end) throws Exception{
		logger.info("resAll Get ......");
		
		ResponseEntity<List<ReservationVO>> entity = null;
		
		logger.info("달력달력 ......"+res_start);
		logger.info("달력달력 ......"+res_end);
	
		//예약된 모든 리스트
		List<ReservationVO> resList = resService.selectAllReservation(res_start, res_end);
		for(ReservationVO res : resList){
			res.setRes_start(res.getRes_start());
			res.setRes_end(res.getRes_end());
			logger.info("예약된 리스트"+res);
		}
		
		try {
			List<ReservationVO> result = resService.selectAllReservation(res_start, res_end);
			
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*------------------------------- 관리자 로그인 시 -------------------------------------- */
	@RequestMapping(value="/reservationAdmin", method=RequestMethod.GET)
	public void reservationAdminGet(Model model, HttpServletRequest request) throws Exception{
		logger.info("reservation Get ......");
		
		HttpSession session = request.getSession();
		LoginDTO loginDTO = (LoginDTO)session.getAttribute("login");
		
		//select 박스
		List<HairStyleVO> hairList = hairService.selectHairStyle();
		
		for(HairStyleVO vo : hairList){
			logger.info("db에서 가져온 헤어시간"+vo.getHair_time());
		}
		
		model.addAttribute("hairList",hairList);

	}
	
	//예약된 리스트들 가져와서 화면에 뿌려줌
		@ResponseBody
		@RequestMapping(value="/resAllAdmin", method=RequestMethod.GET)
		public ResponseEntity<List<ReservationVO>> resAllAdmin(String res_start, String res_end) throws Exception{
			logger.info("resAll Get ......");
			
			ResponseEntity<List<ReservationVO>> entity = null;
			
			logger.info("달력달력 ......"+res_start);
			logger.info("달력달력 ......"+res_end);
		
			//예약된 모든 리스트
			List<ReservationVO> resList = resService.selectAllReservationAdmin(res_start, res_end);
			for(ReservationVO res : resList){
				res.setRes_start(res.getRes_start());
				res.setRes_end(res.getRes_end());
				logger.info("예약자 이름 ......"+res.getMember().getU_name());
				logger.info("예약자 연락처 ......"+res.getMember().getU_phone());
				logger.info("예약된 리스트"+res);
			}
			
			try {
				List<ReservationVO> result = resService.selectAllReservationAdmin(res_start, res_end);
				
				entity = new ResponseEntity<>(result, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
}
