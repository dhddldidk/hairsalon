package com.dgit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDao;
	
	@Override
	public String selectedById(String id) throws Exception {
		
		return memberDao.selectedById(id);
	}

	@Override
	public void registerMember(MemberVO vo) throws Exception {
		memberDao.registerMember(vo);
		
	}

}
