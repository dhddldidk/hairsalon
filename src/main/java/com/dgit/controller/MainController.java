package com.dgit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.HairStyleVO;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.service.HairStyleService;
import com.dgit.service.ReviewBoardService;

@RequestMapping("/main/")
@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private ReviewBoardService boardService;
	
	@Autowired
	private HairStyleService hairService;
	
	@RequestMapping(value="/mainPage", method=RequestMethod.GET)
	public void listPageGet(Model model) throws Exception{
		logger.info("Board mainPageGet Get ......");
		List<ReviewBoardVO> reviewBoard = boardService.selectMainReview();
		model.addAttribute("reviewBoard",reviewBoard);
		
		List<HairStyleVO> hairStyle = hairService.selectAllHairInfo();
		model.addAttribute("hairStyle",hairStyle);
	}
}
