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

}
