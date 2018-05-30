package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.LoginMapper";
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return session.selectOne(namespace+".login", vo);
	}

}
