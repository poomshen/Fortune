/*
* @Class : NoticeController
* @Date : 2016.11.16
* @Author : 김지율
* @Desc : 공지사항게시판 Controller
*/

package com.fortune.notice_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value="noticeWrite.htm", method=RequestMethod.GET)
	public String noticeInsert() {
		System.out.println("NoticeController의 noticeWrite를 탑니다~");
		return "notice/noticeWrite";
	}

	// 글등록 처리(실제 글등록 처리)
	@RequestMapping(value="noticeWrite.htm", method=RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto) throws IOException, ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeWrite를 타고, 글등록을 할꺼다!~");
		System.out.println(ndto.getNotice_title());
		System.out.println(ndto.getNotice_text());
		System.out.println(ndto.getNotice_filename());

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		
		noticeDao.insertNotice(ndto);
		return "redirect:noticeList.htm";
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
	@RequestMapping(value="noticeUpdate.htm", method=RequestMethod.GET)
	public String noticeUpdate(String notice_no, Model model) throws ClassNotFoundException, SQLException {

		System.out.println("NoticeController의 noticeUpdate를 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO noticeUpdate = noticeDao.detailNotice(notice_no);
		model.addAttribute("noticeUpdate", noticeUpdate);

		System.out.println(noticeUpdate.getNotice_title());
		return "notice/noticeUpdate";
	}

	// 게시판 실제 수정처리
	@RequestMapping(value="noticeUpdate.htm", method=RequestMethod.POST)
	public String noticeUpdate(Notice_DTO ndto) throws ClassNotFoundException, SQLException, IOException {

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.updateNotice(ndto);
		return "redirect:noticeDetail.htm?notice_no=" + ndto.getNotice_no();

	}

}
