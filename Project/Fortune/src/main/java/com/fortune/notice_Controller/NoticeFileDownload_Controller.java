/*
* @Class : NoticeFileDownload_Controller
* @Date : 2016.11.21
* @Author : 김지율
* @Desc : 공지사항게시판 파일다운로드 Controller
*/

package com.fortune.notice_Controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeFileDownload_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항게시판 파일다운로드처리
	@RequestMapping(value="noticeFileDownload.htm")
	public void fileDownloadNotice(int notice_no, Model model, HttpServletResponse response) throws Exception {
	    
		System.out.println("NoticeController의 fileDownloadNotice를 탑니다~");
		
		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO fileDownloadNotice = noticeDao.fileDownloadNotice(notice_no);
		model.addAttribute("fileDownloadNotice", fileDownloadNotice);
		
		String storedFileName = fileDownloadNotice.getNotice_filename_re();			
		String originalFileName = fileDownloadNotice.getNotice_filename_org();
				
	    byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\fortune\\noticefile\\"+storedFileName));
	     
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}

}
