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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Join_DTO;
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
		System.out.println("NoticeInsert_Controller/noticeInsert함수");

		return "notice.noticeInsert";		
		
	}

	// 공지사항등록 실제처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.POST)
	public ModelAndView noticeInsert(@Valid Notice_DTO ndto, Errors errors, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("NoticeInsert_Controller/noticeInsert함수");

		ModelAndView view = new ModelAndView();
		if(errors.hasErrors()){
			view.addObject("ndto",ndto);
			view.setViewName("notice.noticeInsert");
			return view;
		}
		
		view.setViewName("redirect:noticeList.htm");
	
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
             
            
            file = new File(filePath + storedFileName);
            //multipartFile.transferTo(file);
            
            if (!originalFileName.equals("")) {
				// 서버에 파일 쓰기 작업
				FileOutputStream fs = new FileOutputStream(filePath + storedFileName);
				fs.write(multipartFile.getBytes());
				fs.close();
			}    		
            
			ndto.setNotice_filename_org(originalFileName);
			ndto.setNotice_filename_re(storedFileName);
			ndto.setNotice_fileext(originalFileExtension);
		}

        //접속한 회원 아이디 얻어오기(추가 작업 : 김중완)
		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Join_DTO join_DTO = (Join_DTO) session.getAttribute("info");
		ndto.setUser_id(join_DTO.getUser_id());
		
		//파일 업로드 NULL값 확인 후 공지사항 작성(추가 작업 : 김중완)
		if(multipartFile.getSize() == 0){
			noticeDao.insertFileNullNotice(ndto);
		}else{
			noticeDao.insertNotice(ndto);
		}
		
		return view;

	}
	

}      
            
        