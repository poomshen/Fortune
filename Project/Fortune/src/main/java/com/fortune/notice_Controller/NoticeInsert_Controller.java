/*
* @Class : NoticeInsert_Controller
* @Date : 2016.11.21
* @Author : 김지율
* @Desc : 공지사항게시판 Insert Controller
*/

package com.fortune.notice_Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
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
	
	//파일저장될위치 임시지정
	private static final String filePath = "C:\\fortune\\noticefile\\";
/*	String exceptionOccured = "ARITHMETIC_EXCEPTION";*/

	// 공지사항등록 화면처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.GET)
	public String noticeInsert() throws Exception {
		System.out.println("NoticeController의 noticeInsert를 탑니다~");
		
/*		if (exceptionOccured.equalsIgnoreCase("NULL_POINTER")) {
			throw new NullPointerException("Null Pointer Exception");
		} else if (exceptionOccured.equalsIgnoreCase("IO_EXCEPTION")) {
			throw new IOException("IO Exception");
		} else if (exceptionOccured.equalsIgnoreCase("ARITHMETIC_EXCEPTION")) {
			throw new ArithmeticException("Arithmetic Exception");
		}*/
		
		return "notice.noticeInsert";		
		
	}

	// 공지사항등록 실제처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto, HttpServletRequest request)
			throws Exception {

		System.out.println("NoticeController의 noticeInsert를 타서, 실제로 글작성을 할꺼지롱!");		

/*		if (exceptionOccured.equalsIgnoreCase("NULL_POINTER")) {
			throw new NullPointerException("Null Pointer Exception");
		} else if (exceptionOccured.equalsIgnoreCase("IO_EXCEPTION")) {
			throw new IOException("IO Exception");
		} else if (exceptionOccured.equalsIgnoreCase("ARITHMETIC_EXCEPTION")) {
			throw new ArithmeticException("Arithmetic Exception");
		}*/
		
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
	
/*	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Exception e) {
		return "error.NullPointerException";
	}

	@ExceptionHandler(IOException.class)
	public String handleIOException(Exception e) {
		return "error.NullPointerException";
	}

	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		return "error.Exception";
	}*/

}      
            
        