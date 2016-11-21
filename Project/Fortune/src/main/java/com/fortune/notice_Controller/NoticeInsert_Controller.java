/*
* @Class : NoticeInsert_Controller
* @Date : 2016.11.16
* 		  2016.11.19 수정중
* @Author : 김지율
* @Desc : 공지사항게시판 Insert Controller
* 		  11.19 파일업로드 기능구현 헷갈려서, 컨트롤러 각각 분리..
*/

package com.fortune.notice_Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeInsert_Controller {

	@Autowired
	private SqlSession sqlSession;

	//공지사항등록 화면처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.GET)
	public String noticeInsert(){
		System.out.println("NoticeInsertController를 GET방식으로 탑니다~");
		return "notice/noticeInsert";		
	}
	
	//공지사항등록 실제처리
	@RequestMapping(value="noticeInsert.htm", method=RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		
		System.out.println("NoticeInsertController를 POST방식으로 탑니다~");
	    System.out.println("ndto : " + ndto.getNotice_title()); 
	    System.out.println("ndto : " + ndto.getNotice_text());
	    System.out.println("ndto : " + ndto.getFile().getOriginalFilename()); 
	    
	    MultipartFile mf = ndto.getFile();	   
	    
	    if(mf != null && mf.getSize() != 0){
	    	String fname = mf.getOriginalFilename();
	    	String path = request.getServletContext().getRealPath("/notice");
	    	String fullpath = path + "\\" + fname;
	    	System.out.println(fname + " / " + path + " / " + fullpath);
	    	
	    	if(!fname.equals("")){
				 //서버에 파일 쓰기 작업 
				  FileOutputStream fs = new FileOutputStream(fullpath);
				  fs.write(mf.getBytes());
				  fs.close();
			  }	
	    	ndto.setNotice_filename(fname);
	    }
	    
	    INotice noticeDao = sqlSession.getMapper(INotice.class);
	    
	    noticeDao.insertNotice(ndto);
		return "redirect:noticeList.htm";		
	}
	
	//파일명변경
	public File renameFile(File f) { // File f는 원본 파일
		if (createNewFile(f))
			return f; // 생성된 f가 중복되지 않으면 리턴

		String name = f.getName();
		String body = null;
		String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 없을때
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else { // 확장자가 있을때
			body = name;
			ext = "";
		}

		int count = 0;
		// 중복된 파일이 있을때
		// 파일이름뒤에 a숫자.확장자 이렇게 들어가게 되는데 숫자는 9999까지 된다.
		while (!createNewFile(f) && count < 9999) {
			count++;
			String newName = body + count + ext;
			f = new File(f.getParent(), newName);
		}
		return f;
	}
	
	private boolean createNewFile(File f) {
		try {
			return f.createNewFile(); // 존재하는 파일이 아니면
		} catch (IOException ignored) {
			return false;
		}
	}

}
