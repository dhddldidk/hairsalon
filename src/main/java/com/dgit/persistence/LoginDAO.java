package com.dgit.persistence;

import com.dgit.domain.MemberVO;

public interface LoginDAO {

	public MemberVO login(MemberVO vo) throws Exception;
}
