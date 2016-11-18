/*
* @Class : NoticeController
* @Date : 2016.11.16
* @Author : 김지율
* @Desc : 공지사항게시판 Controller
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
public class NoticeController {

	@Autowired
	private SqlSession sqlSession;

	// 공지사항 글목록보기
	@RequestMapping("/noticeList.htm")
	public String noticeList(String pg, String f, String q, Model model) throws ClassNotFoundException, SQLException {

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "NOTICE_TITLE";
		String query = "%%";
		//////////////////////////////////////
		if (pg != null && pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && f.equals("")) {
			field = f;
		}
		if (q != null && q.equals("")) {
			query = q;
		}

		System.out.println(page + " / " + field + " / " + query);

		System.out.println("NoticeController의 noticeList를 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		List<Notice_DTO> noticeList = noticeDao.listNotice(page, field, query);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}

	// 글등록 화면 처리
	@RequestMapping(value = "noticeInsert.htm", method = RequestMethod.GET)
	public String noticeInsert() {
		System.out.println("NoticeController의 noticeInsert를 탑니다~");
		return "notice/noticeInsert";
	}

/*	// 글등록 처리(실제 글등록 처리)
	@RequestMapping(value = "noticeInsert.htm", method = RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto, MultipartHttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeInsert를 타고, 글등록을 할꺼다!~");
		System.out.println(ndto.getNotice_title());
		System.out.println(ndto.getNotice_text());
		System.out.println(ndto.getNoticeFile().getName());

		MultipartFile noticeFile = ndto.getNoticeFile();
		String notice_filename = new String();

		if (noticeFile != null && noticeFile.getSize() != 0) {

			String nfName = noticeFile.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/notice");
			String fullpath = path + "\\" + nfName;

			System.out.println(nfName + " / " + path + " / " + fullpath);

			if (!nfName.equals("")) {
				// 서버에 파일 쓰기 작업
				FileOutputStream fs = new FileOutputStream(fullpath);
				fs.write(noticeFile.getBytes());
				fs.close();
			}
			notice_filename.add(nfName); // 실 DB Insert 작업시 .. 파일명
		}
		}

	ndto.
		INotice noticeDao = sqlSession.getMapper(INotice.class);

		String notice_filename = noticeFile.getOriginalFilename();
		System.out.println("공지사항게시판 첨부파일이름 : " + notice_filename);

		noticeDao.insertNotice(ndto);
		return "redirect:noticeList.htm";
	}
*/


	 // 글등록 처리(실제 글등록 처리)
	 @RequestMapping(value="noticeInsert.htm", method=RequestMethod.POST)
	 public String noticeInsert(Notice_DTO ndto, MultipartHttpServletRequest request)
	   throws IOException, ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeInsert를 타고, 글등록을 할꺼다!~");
		System.out.println("ndto : " + ndto.getNotice_title()); 
		System.out.println("ndto : " + ndto.getNotice_text());
		System.out.println("ndto getName : " + ndto.getFile().getName()); 
		System.out.println("ndto getOriginalFilename : " + ndto.getFile().getOriginalFilename()); 

		MultipartFile mf = request.getFile("file");
		INotice noticeDao = sqlSession.getMapper(INotice.class);

		String fname = mf.getOriginalFilename();
		System.out.println("fname : " + fname);
		
		//확장자 구하는 부분
		//int lastindexof = mf.getOriginalFilename().lastIndexOf(".");
		//int length = mf.getOriginalFilename().length();
		//String substr = mf.getOriginalFilename().substring(lastindexof, length);
		
		String upload_path = request.getSession().getServletContext().getRealPath("upload");
		File file = new File(upload_path + "/" + fname);
		file = renameFile(file);
		
		if (mf.getSize() != 0) {
			mf.transferTo(file);
		}
		
		//DB insert 시작
		Notice_DTO nfdto = new Notice_DTO();
		nfdto.setNotice_filename(file.getName());
		noticeDao.insertNotice(nfdto);
		
		//View 화면에 뿌려주기 위한 list
		int page = 1;
		int row_size = 5;

		//int total_count = noticeDao.countFile();	//file 개수
		//System.out.println("totalcount : " + total_count);

		// ... 목록
		//int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		//System.out.println("페이지수 : " + all_page);

		//int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		//int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		//int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		//if (to_page > all_page) { // 예) 20>17
		//	to_page = all_page;
		//}
		
		return fname;
		
		
	 }

	 


	
	
	
	
	
	
	// 글상세보기
	@RequestMapping("noticeDetail.htm")
	public String noticeDetail(String notice_no, Model model) throws ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeDetail을 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO noticeDetail = noticeDao.detailNotice(notice_no);
		model.addAttribute("noticeDetail", noticeDetail);

		return "notice/noticeDetail";
	}

	// 글삭제하기
	@RequestMapping("noticeDelete.htm")
	public String noticeDelete(String notice_no) throws ClassNotFoundException, SQLException {
		System.out.println("notice_no : " + notice_no);

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.deleteNotice(notice_no);
		return "redirect:noticeList.htm"; // 리스트 화면 (controller 타서 데이터 출력)
	}

	// 글 수정하기
	@RequestMapping(value = "noticeUpdate.htm", method = RequestMethod.GET)
	public String noticeUpdate(String notice_no, Model model) throws ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeUpdate를 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO noticeUpdate = noticeDao.detailNotice(notice_no);
		model.addAttribute("noticeUpdate", noticeUpdate);

		System.out.println(noticeUpdate.getNotice_title());
		return "notice/noticeUpdate";
	}

	// 게시판 실제 수정처리
	@RequestMapping(value = "noticeUpdate.htm", method = RequestMethod.POST)
	public String noticeUpdate(Notice_DTO ndto) throws ClassNotFoundException, SQLException, IOException {

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.updateNotice(ndto);
		return "redirect:noticeDetail.htm?notice_no=" + ndto.getNotice_no();

	}
	
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
