package com.dgit.service;

import com.dgit.domain.MemberVO;

public interface LoginService {

	public MemberVO login(MemberVO vo) throws Exception;
}
