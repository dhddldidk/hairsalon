package com.dgit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.Criteria;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReviewBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ReviewBoardService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@RequestMapping("/board/")
@Controller
public class ReviewBoardController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewBoardController.class);
	
	@Autowired
	private ReviewBoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//게시판 리스트+페이징
	@RequestMapping(value="/reviewListPage", method=RequestMethod.GET)
	public void ReviewListPageGet(Model model,@ModelAttribute("cri")SearchCriteria cri) throws Exception{
		logger.info("reviewListPage Get ......");
		logger.info("cri.toString()"+cri.toString());
		
		List<ReviewBoardVO> boardList = service.listSearch(cri);
		model.addAttribute("boardList",boardList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalSearchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
	}
	
	//게시판 등록 get
	@RequestMapping(value="/reviewRegisterPage", method=RequestMethod.GET)
	public void ReviewRegisterPageGet(){
		logger.info("reviewRegisterPage Get ......");
		
		
	}
	
	//게시판 등록 post
	@RequestMapping(value="/reviewRegisterPage", method=RequestMethod.POST)
	public String ReviewRegisterPagePost(ReviewBoardVO vo, List<MultipartFile> imageFiles) throws Exception{
		logger.info("reviewRegisterPage Post ......");
		
		logger.info(vo.toString());
		
		if(!imageFiles.get(0).getOriginalFilename().equals("")){
			ArrayList<String> list = new ArrayList<>();
			for(MultipartFile file:imageFiles){
				logger.info("filename : "+file.getOriginalFilename());
				
				String thumb = UploadFileUtils.uploadFile(uploadPath, 
											file.getOriginalFilename(), 
											file.getBytes());
				list.add(thumb);
			}
			vo.setFiles(list.toArray(new String[list.size()]));
		}
		service.insertReview(vo);
		
		return "redirect:/board/reviewListPage";
	}
	
	//게시판 상세보기
	@RequestMapping(value="/reviewReadPage", method=RequestMethod.GET)
	public void ReviewReadPageGet(Model model, int rb_no, boolean flag, @ModelAttribute("cri")SearchCriteria cri) throws Exception{
		logger.info("reviewReadPage Get ......");
		ReviewBoardVO reviewBoard = service.readReview(rb_no, flag);
		model.addAttribute("reviewBoard",reviewBoard);
		
	}
	
	//게시판 상세보기에서 첨부파일 이미지 나타나도록 처리하기 위해
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String att_filename) throws Exception{
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		
		logger.info("[displayFile] filename : "+ att_filename);
		
		try{
			String format = att_filename.substring(att_filename.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(format);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			
			in = new FileInputStream(uploadPath+"/"+att_filename);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
														headers,
														HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	//게시판 수정하기 get
	@RequestMapping(value="/reviewUpdatePage", method=RequestMethod.GET)
	public String ReviewtUpdatePage(Model model, int rb_no, @ModelAttribute("cri")SearchCriteria cri) throws Exception{
		logger.info("reviewUpdatePage Get ......");
		ReviewBoardVO reviewBoard = service.readReview(rb_no, false);
		model.addAttribute("reviewBoard",reviewBoard);
		return "/board/reviewUpdatePage";
	}
	
	//게시판 수정 post
	@RequestMapping(value="/reviewUpdatePage", method=RequestMethod.POST)
	public String ReviewUpdatePagePost(ReviewBoardVO vo, Model model) throws Exception{
		logger.info("ReviewUpdatePagePost Post ......");
			
		logger.info(vo.toString());
		service.updateReview(vo);	
	
		//model.addAttribute("rb_no", vo.getRb_no());
		model.addAttribute("flag", false);
		return "redirect:/board/reviewListPage";
	}
	
	//게시판 삭제하기
	@RequestMapping(value="/reviewDeletePage", method=RequestMethod.GET)
	public String ReviewDeletePageGet(int rb_no) throws Exception{
		logger.info("reviewDeletePage Get ......");
		logger.info("rb_no......"+rb_no);
		service.deleteReview(rb_no);
		return "redirect:/board/reviewListPage";
	}
	
	
}
