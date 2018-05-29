package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.MemberMapper";
	
	@Override
	public String selectedById(String id) throws Exception {
		
		return session.selectOne(namespace+".selectedById", id);
	}

	@Override
	public void registerMember(MemberVO vo) throws Exception {
		session.selectOne(namespace+".registerMember", vo);
		
	}

}
