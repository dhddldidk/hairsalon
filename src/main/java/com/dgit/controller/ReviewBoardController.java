package com.dgit.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.ReviewBoardVO;
import com.dgit.service.ReviewBoardService;

@RequestMapping("/board/")
@Controller
public class ReviewBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);
	
	@Autowired
	private ReviewBoardService service;
	
	
	
	
	//게시판 리스트
	@RequestMapping(value="/reviewListPage", method=RequestMethod.GET)
	public void ReviewListPageGet(Model model) throws Exception{
		logger.info("reviewListPage Get ......");
		
		List<ReviewBoardVO> boardList = service.selectAllReview();
		model.addAttribute("boardList",boardList);
		
	}
	
	//게시판 등록
	@RequestMapping(value="/reviewRegisterPage", method=RequestMethod.GET)
	public void ReviewRegisterPageGet(){
		logger.info("reviewRegisterPage Get ......");
		
		
	}
	
	@RequestMapping(value="/reviewRegisterPage", method=RequestMethod.POST)
	public String ReviewRegisterPagePost(ReviewBoardVO vo) throws Exception{
		logger.info("reviewRegisterPage Post ......");
		
		logger.info(vo.toString());
		
		/*Date date = new Date();
		vo.setRb_regdate(date);
		logger.info("게시글 등록일"+vo.getRb_regdate());*/
		service.insertReview(vo);
		
		return "redirect:/board/reviewListPage";
	}
	
	//게시판 상세보기
	@RequestMapping(value="/reviewReadPage", method=RequestMethod.GET)
	public void ReviewReadPageGet(Model model, int rb_no) throws Exception{
		logger.info("reviewReadPage Get ......");
		ReviewBoardVO reviewBoard = service.readReview(rb_no);
		model.addAttribute("reviewBoard",reviewBoard);
		
	}
	
	//게시판 수정하기
	@RequestMapping(value="/reviewUpdatePage", method=RequestMethod.GET)
	public void ReviewtUpdatePage(Model model, int rb_no) throws Exception{
		logger.info("reviewUpdatePage Get ......");
		ReviewBoardVO reviewBoard = service.readReview(rb_no);
		model.addAttribute("reviewBoard",reviewBoard);
		
	}
}
