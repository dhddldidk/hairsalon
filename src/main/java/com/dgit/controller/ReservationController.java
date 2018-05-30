package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/reservation/")
@Controller
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public void reservationGet(){
		logger.info("reservation Get ......");
		
		
	}
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendar(){
		logger.info("calendar Get ......");
		
		
	}
}
