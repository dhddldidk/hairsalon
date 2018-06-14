package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.HairStyleVO;
import com.dgit.persistence.HairStyleDAO;

@Service
public class HairStyleServiceImpl implements HairStyleService {

	@Autowired
	HairStyleDAO dao;
	
	@Override
	public List<HairStyleVO> selectHairStyle() throws Exception {
		
		return dao.selectHairStyle();
	}

	@Transactional
	@Override
	public void insertHairStyle(HairStyleVO vo) throws Exception {
		dao.insertHairStyle(vo);
		
		if(vo.gethFiles()==null){
			return;
		}
		for(String hair_filename : vo.gethFiles()){
			dao.addHairAttach(hair_filename);
		}
	}

	@Override
	public List<HairStyleVO> selectAllHairInfo() throws Exception {
		
		return dao.selectAllHairInfo();
	}

	@Transactional
	@Override
	public HairStyleVO readHairStyle(int hair_no) throws Exception {
		
		HairStyleVO vo = dao.readHairStyle(hair_no);
		List<String> files = dao.getHairAttach(hair_no);
		vo.sethFiles(files.toArray(new String[files.size()]));
		return vo;
	}

	@Transactional
	@Override
	public void deleteHairStyle(int hair_no) throws Exception {
		dao.deleteHairAttach(hair_no, null);
		dao.deleteHairStyle(hair_no);
		
	}

	@Transactional
	@Override
	public void updateHairStyle(HairStyleVO vo, String[] oldFiles) throws Exception {
		dao.updateHairStyle(vo);
		
		//첨부파일 수정할 때 선택된 파일 지우기
		int hair_no = vo.getHair_no();
		if(oldFiles!=null){
			for(String deletedFile : oldFiles){
				dao.deleteHairAttach(hair_no, deletedFile);
			}
		}
		
		//첨부파일 새로 선택한거 업로드
		String[] files = vo.gethFiles();
		
		if(files==null){
			return;
		}
		
		for(String hair_filename : files){
			dao.replaceHairAttach(hair_filename, hair_no);
		}
	}

	

	

}
