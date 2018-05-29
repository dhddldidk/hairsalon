package com.dgit.service;

import com.dgit.domain.MemberVO;

public interface MemberService {
	public String selectedById(String id) throws Exception;
	public void registerMember(MemberVO vo) throws Exception;
}
