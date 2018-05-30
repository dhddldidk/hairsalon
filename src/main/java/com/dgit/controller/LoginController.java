package com.dgit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.LoginDTO;
import com.dgit.domain.MemberVO;
import com.dgit.service.LoginService;

@RequestMapping("/user")
@Controller
public class LoginController {

	
	@Autowired
	LoginService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGet(){
		logger.info("login Get ......");
		
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPost(MemberVO vo, Model model, RedirectAttributes rttr) throws Exception{
		
		logger.info("login Post ......");
		logger.info(vo.toString());
		
		vo=service.login(vo);
		
		//로그인 버튼을 눌렀을 때 
		//아이디와 패스워드가 일치하지 않으면 return
		//RedirectAttributes를 사용하면 한번만
		//jsp로 값을 보낼 수 있음
		//아이디와 패스워드가 일치하지 않으면 
		//login화면으로 redirect 시켜줌
		if(vo==null){
			rttr.addFlashAttribute("loginFail", true);
			return "redirect:/user/login";
		}
		
		LoginDTO loginDto = new LoginDTO();
		loginDto.setU_id(vo.getU_id());
		loginDto.setU_name(vo.getU_name());
		
		logger.info("이거 찍어보기"+loginDto.toString());
		
		model.addAttribute("loginDTO",loginDto);
		
		return "/user/loginPost";
	}
	
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(HttpSession session) throws Exception {
		logger.info("logOut............................");
		session.invalidate();// session이 날아감 = 로그아웃 됨
		
		return "redirect:/";
	}
}
