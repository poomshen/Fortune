/*
* @Class : NoticeDelete_Controller
* @Date : 2016.11.21
* @Author : 김지율
* @Desc : 공지사항게시판 Delete Controller
*/

package com.fortune.notice_Controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeDelete_Controller {

	@Autowired
	private SqlSession sqlSession;

	// 공지사항글 삭제하기
	@RequestMapping("noticeDelete.htm")
	public String noticeDelete(int notice_no) throws ClassNotFoundException, SQLException {
		System.out.println("notice_no : " + notice_no);

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.deleteNotice(notice_no);
		return "redirect:noticeList.htm"; // 리스트 화면 (controller 타서 데이터 출력)
	}
}
