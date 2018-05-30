package com.dgit.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;

@RequestMapping("/member/")
@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
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

		return "redirect:/member/login";
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
}
