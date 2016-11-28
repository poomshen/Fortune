/*
* @Class : NoticeUpdate_Controller
* @Date : 2016.11.16
* @Author : 김지율
* @Desc : 공지사항게시판 Update Controller
*/

package com.fortune.notice_Controller;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeUpdate_Controller {

	@Autowired
	private SqlSession sqlSession;

	// 글 수정하기
	@RequestMapping(value="noticeUpdate.htm", method=RequestMethod.GET)
	public String noticeUpdate(int notice_no, Model model) {

		System.out.println("NoticeController의 noticeUpdate를  GET방식으로 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO noticeUpdate = noticeDao.detailNotice(notice_no);
		model.addAttribute("noticeUpdate", noticeUpdate);

		System.out.println(noticeUpdate.getNotice_title());
		return "notice.noticeUpdate";
	}

	// 게시판 실제 수정처리
	@RequestMapping(value="noticeUpdate.htm", method=RequestMethod.POST)
	public String noticeUpdate(Notice_DTO ndto) {

		System.out.println("NoticeController의 noticeUpdate를  POST방식으로 타서 실제수정 할꺼지롱~");
		
		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.updateNotice(ndto);
		return "redirect:noticeDetail.htm?notice_no=" + ndto.getNotice_no();

	}

}
