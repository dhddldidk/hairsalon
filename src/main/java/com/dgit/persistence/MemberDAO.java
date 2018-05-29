package com.dgit.persistence;

import com.dgit.domain.MemberVO;

public interface MemberDAO {
	public String selectedById(String id) throws Exception;
	public void registerMember(MemberVO vo) throws Exception;
}
