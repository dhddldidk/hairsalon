package com.dgit.hairsalon;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ReviewBoardVO;
import com.dgit.persistence.ReviewBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewBoardVOTest {

	@Autowired
	ReviewBoardDAO dao;
	
	//@Test
	public void test1insertReview() throws Exception{
		
		ReviewBoardVO vo = new ReviewBoardVO();
		vo.setRb_title("일반컷 리뷰");
		vo.setRb_context("일반컷 리뷰입니다. 좋아요 좋아요");
		vo.setRb_writer("aaaaaa");
		dao.insertReview(vo);
		
	}
	
	@Test
	public void test2selectAllReview() throws Exception{
		List<ReviewBoardVO> list = dao.selectAllReview();
		
		for(ReviewBoardVO vo : list){
			System.out.println("댓글 하나씩 찍어보기"+vo);
		}
	}
	
}
