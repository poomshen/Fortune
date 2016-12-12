/*
* @Class : NoticeDetail_Controller
* @Date : 2016.11.16
* @Author : 김지율
* @Desc : 공지사항게시판 Detail Controller
*/

package com.fortune.notice_Controller;

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

	// 공지사항글 상세보기
	@RequestMapping("noticeDetail.htm")
	public String noticeDetail(int notice_no, Model model){

		System.out.println("NoticeDelete_Controller/noticeDetail함수");

		INotice noticeDetailDao = sqlSession.getMapper(INotice.class);
		noticeDetailDao.updateHits(notice_no);
		Notice_DTO noticeDetailDto = noticeDetailDao.detailNotice(notice_no);
		model.addAttribute("noticeDetail", noticeDetailDto);
		
		
		return "notice.noticeDetail";
	}

}
