package com.dgit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.HairStyleVO;
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
	public void reservationGet(Model model) throws Exception{
		logger.info("reservation Get ......");
		
		//select 박스
		List<HairStyleVO> hairList = hairService.selectHairStyle();
		
		model.addAttribute("hairList",hairList);
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/resAll", method=RequestMethod.GET)
	public ResponseEntity<List<ReservationVO>> resAll(String res_start, String res_end) throws Exception{
		logger.info("resAll Get ......");
		
		ResponseEntity<List<ReservationVO>> entity = null;
		
		logger.info("달력달력 ......"+res_start);
		logger.info("달력달력 ......"+res_end);
	
		//예약된 리스트
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
	
	
}
