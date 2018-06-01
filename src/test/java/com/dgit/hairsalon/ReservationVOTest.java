package com.dgit.hairsalon;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ReservationVO;
import com.dgit.persistence.ReservationDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReservationVOTest {

	@Autowired
	ReservationDAO dao;
	
	@Test
	public void test1selectAllReservation() throws Exception{
		List<ReservationVO> list = dao.selectAllReservation();
		for(ReservationVO vo : list){
			System.out.println(vo);
		}
	}
}
