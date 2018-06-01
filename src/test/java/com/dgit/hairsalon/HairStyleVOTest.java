package com.dgit.hairsalon;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.HairStyleVO;
import com.dgit.persistence.HairStyleDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class HairStyleVOTest {

	@Autowired
	HairStyleDAO dao;
	
	@Test
	public void test1selectHairStyle() throws Exception{
		List<HairStyleVO> list = dao.selectHairStyle();
		for(HairStyleVO vo : list){
			System.out.println(vo);
		}
	}
}
