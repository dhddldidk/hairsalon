package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO dao;
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return dao.login(vo);
	}

}
