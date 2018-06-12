package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.Criteria;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReplyVO;
import com.dgit.service.ReplyService;

@RequestMapping("/replies")
@RestController
public class ReplyController {

	@Autowired
	ReplyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		logger.info(vo.toString());
		
		try {
			service.insertReply(vo);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	@RequestMapping(value="/{rb_noVal}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("rb_noVal") int rb_noVal,
								Criteria cri){//cri안에 page 변수에 담음
		ResponseEntity<Map<String, Object>> entity = null;
		
		logger.info("rb_noVal : "+rb_noVal);
		
		try{
			List<ReplyVO> list = service.listReply(rb_noVal, cri);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.replyTotalCount(rb_noVal));
			
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{reply_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("reply_no") int reply_no){
			ResponseEntity<String> entity = null;
			logger.info("[delete] reply_no : "+ reply_no);
			
			try{
				service.deleteReply(reply_no);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
}
