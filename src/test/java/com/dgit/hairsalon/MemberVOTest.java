package com.dgit.hairsalon;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberVOTest {
	@Autowired
	MemberDAO dao;
	
	@Test
	public void test1SelectedById() throws Exception{
		
		String uid = dao.selectedById("aaa");
		System.out.println("검색한 아이디"+uid);
	}
}
