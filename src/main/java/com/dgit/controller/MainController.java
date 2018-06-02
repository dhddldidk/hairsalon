package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/board/")
@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);
	
	@RequestMapping(value="/mainPage", method=RequestMethod.GET)
	public void listPageGet(){
		logger.info("Board mainPageGet Get ......");
		
		
	}
}
