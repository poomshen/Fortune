/*
* @Class : NoticeDetail_Controller
* @Date : 2016.11.19
* @Author : 김지율
* @Desc : 공지사항게시판 Detail Controller
* 		  11.19 분리작업 진행중
*/

package com.fortune.notice_Controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeDetail_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 글상세보기
	@RequestMapping("noticeDetail.htm")
	public String noticeDetail(String notice_no, Model model) throws ClassNotFoundException, SQLException {

		System.out.println("NoticeDetailController를 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		Notice_DTO noticeDetail = noticeDao.detailNotice(notice_no);
		model.addAttribute("noticeDetail", noticeDetail);

		return "notice/noticeDetail";
	}

}
