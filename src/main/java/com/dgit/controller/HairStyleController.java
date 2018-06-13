package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/hairstyle")
@Controller
public class HairStyleController {

	private static final Logger logger = LoggerFactory.getLogger(HairStyleController.class);
	
	@RequestMapping(value="/hairstyleList", method=RequestMethod.GET)
	public void hairstyleListGet(){
		logger.info("hairstyleList Get ......");
		
		
	}
	
	@RequestMapping(value="/hairstyleRegister", method=RequestMethod.GET)
	public void hairstyleRegisterGet(){
		logger.info("hairstyle Get ......");
		
		
	}
}
