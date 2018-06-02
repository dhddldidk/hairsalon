package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/board/")
@Controller
public class ReviewBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);
	
	@RequestMapping(value="/reviewListPage", method=RequestMethod.GET)
	public void ReviewListPageGet(){
		logger.info("reviewListPage Get ......");
		
		
	}
	
	@RequestMapping(value="/reviewRegisterPage", method=RequestMethod.GET)
	public void ReviewRegisterPageGet(){
		logger.info("reviewRegisterPage Get ......");
		
		
	}
}
