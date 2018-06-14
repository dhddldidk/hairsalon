package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.HairStyleVO;

@Repository
public class HairStyleDAOImpl implements HairStyleDAO {

	@Autowired
	SqlSession session;
	
	private static final String namespace = "com.dgit.mapper.HairStyleMapper";
	
	@Override
	public List<HairStyleVO> selectHairStyle() throws Exception {
		
		return session.selectList(namespace+".selectHairStyle");
	}

	@Override
	public void insertHairStyle(HairStyleVO vo) throws Exception {
		session.insert(namespace+".insertHairStyle", vo);
		
	}

	@Override
	public void addHairAttach(String hair_filename) throws Exception {
		session.insert(namespace+".addHairAttach", hair_filename);
		
	}

	@Override
	public List<HairStyleVO> selectAllHairInfo() throws Exception {
		
		return session.selectList(namespace+".selectAllHairInfo");
	}

}
