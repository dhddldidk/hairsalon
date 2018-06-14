package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public HairStyleVO readHairStyle(int hair_no) throws Exception {
		
		return session.selectOne(namespace+".readHairStyle", hair_no);
	}

	@Override
	public List<String> getHairAttach(int hair_no) throws Exception {
		
		return session.selectList(namespace+".getHairAttach", hair_no);
	}

	@Override
	public void deleteHairStyle(int hair_no) throws Exception {
		session.delete(namespace+".deleteHairStyle", hair_no);
		
	}

	@Override
	public void deleteHairAttach(int hair_no, String hair_filename) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("hair_no", hair_no);
		map.put("hair_filename", hair_filename);
		session.delete(namespace+".deleteHairAttach", map);
		
	}

	@Override
	public void updateHairStyle(HairStyleVO vo) throws Exception {
		session.update(namespace+".updateHairStyle", vo);
		
	}

	@Override
	public void replaceHairAttach(String hair_filename, int hair_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("hair_filename", hair_filename);
		map.put("hair_no", hair_no);
		session.insert(namespace+".replaceHairAttach", map);
		
	}

}
