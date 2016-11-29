/*
* @Class : NoticeInsert_Controller
* @Date : 2016.11.21
* @Author : 김지율
* @Desc : 공지사항게시판 Insert Controller
* */


package com.fortune.notice_Controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;
import com.fortune.notice_Util.NoticeFile_Utils;

@Controller
public class NoticeInsert_Controller {

	@Autowired
	private SqlSession sqlSession;
	
	//public Logger logger;	
	
	//파일저장될위치 임시지정
	private static final String filePath = "C:\\fortune\\noticefile\\";


	// 공지사항등록 화면처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.GET)
	public String noticeInsert() {
		System.out.println("NoticeController의 noticeInsert를 탑니다~");
		
		return "notice.noticeInsert";		
		
	}

	// 공지사항등록 실제처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto, HttpServletRequest request) throws Exception {

		System.out.println("NoticeController의 noticeInsert를 타서, 실제로 글작성을 할꺼지롱!");		

	
		MultipartFile multipartFile = ndto.getFile();
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        
        File file = new File(filePath);
        if(file.exists() == false){
            file.mkdirs();
        }
		
        if(multipartFile.isEmpty() == false){
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            storedFileName = NoticeFile_Utils.getRandomString() + originalFileExtension;
             
            
            System.out.println("Notice_title : " + ndto.getNotice_title());
    		System.out.println("Notice_text: " + ndto.getNotice_text());
    		System.out.println("Name : " + ndto.getFile().getName());
    		System.out.println("OriginalFilename : " + ndto.getFile().getOriginalFilename());
    		System.out.println("storedFileName : " + ndto.getNotice_filename_re());
            file = new File(filePath + storedFileName);
            //multipartFile.transferTo(file);
            
           System.out.println("file :" + file);
            if (!originalFileName.equals("")) {
				// 서버에 파일 쓰기 작업
            	  System.out.println("originalFileName :" + originalFileName);
				FileOutputStream fs = new FileOutputStream(filePath + storedFileName);
				System.out.println(multipartFile.getBytes());
				fs.write(multipartFile.getBytes());
				fs.close();
			}    		
            
			ndto.setNotice_filename_org(originalFileName);
			ndto.setNotice_filename_re(storedFileName);
			ndto.setNotice_fileext(originalFileExtension);
		}

		INotice noticeDao = sqlSession.getMapper(INotice.class);

		noticeDao.insertNotice(ndto);
		return "redirect:noticeList.htm";

	}
	

}      
            
        