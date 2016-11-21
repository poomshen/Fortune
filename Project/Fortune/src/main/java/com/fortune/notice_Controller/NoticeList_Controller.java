/*
* @Class : NoticeList_Controller
* @Date : 2016.11.21
* @Author : 김지율
* @Desc : 공지사항게시판 List Controller
*/

package com.fortune.notice_Controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeList_Controller {

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

}
