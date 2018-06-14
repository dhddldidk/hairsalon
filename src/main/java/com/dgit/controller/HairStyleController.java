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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgit.domain.HairStyleVO;
import com.dgit.service.HairStyleService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@RequestMapping("/hairstyle")
@Controller
public class HairStyleController {

	@Autowired
	private HairStyleService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HairStyleController.class);
	
	@RequestMapping(value="/hairstyleList", method=RequestMethod.GET)
	public void hairstyleListGet(Model model) throws Exception{
		logger.info("hairstyleList Get ......");
		
		List<HairStyleVO> hairList = service.selectAllHairInfo();
		
		for(HairStyleVO vo : hairList){
			logger.info(vo.toString());
		}
		
		model.addAttribute("hairList", hairList);
	}
	
	@RequestMapping(value="/hairstyleRegister", method=RequestMethod.GET)
	public void hairstyleRegisterGet(){
		logger.info("hairstyle Get ......");
			
	}
	
	@RequestMapping(value="/hairstyleRegister", method=RequestMethod.POST)
	public String hairstyleRegisterPost(HairStyleVO vo, List<MultipartFile> hairFiles) throws Exception{
		logger.info("hairstyleRegister Post ......");
		logger.info(vo.toString());
		
		if(!hairFiles.get(0).getOriginalFilename().equals("")){
			ArrayList<String> list = new ArrayList<>();
			for(MultipartFile file:hairFiles){
				logger.info("filename : "+file.getOriginalFilename());
				
				String thumb = UploadFileUtils.uploadFile(uploadPath, 
												file.getOriginalFilename(),
												file.getBytes());
				list.add(thumb);
			}
			vo.sethFiles(list.toArray(new String[list.size()]));
		}
		service.insertHairStyle(vo);
		
		return "redirect:/hairstyle/hairstyleList";
	}
	
	@ResponseBody
	@RequestMapping("/displayHairFile")
	public ResponseEntity<byte[]> displayHairFile(String hair_filename) throws Exception{
		ResponseEntity<byte[]> entity =null;
		InputStream in = null;
		
		logger.info("[displayHairFile] filename : "+hair_filename);
		
		try{
			
			String format = hair_filename.substring(hair_filename.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(format);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			
			in = new FileInputStream(uploadPath+"/"+hair_filename);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
														headers,
														HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		return entity;
	}
}
