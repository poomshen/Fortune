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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeList_Controller {

	@Autowired
	private SqlSession sqlSession;

	// 공지사항 글목록보기
	@RequestMapping("/noticeList.htm")
	public ModelAndView noticeList(String pg) throws ClassNotFoundException, SQLException {
	
		System.out.println("NoticeController의 noticeList를 탑니다~");
		
		INotice noticeListDao = sqlSession.getMapper(INotice.class);
		
		int page = 1;
		String str_pg = pg;
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		int row_size = 9;
		
		int total_count = noticeListDao.CountNotice(); //공지사항 글 개수
		System.out.println("total_count : " + total_count);
		
		//공지사항 글 목록
		int all_page = (int)Math.ceil(total_count / (double)row_size); //페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + all_page);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (to_page > all_page) { // 예) 20>17
			to_page = all_page;
		}

		List<Notice_DTO> noticelist = noticeListDao.listNotice(page);	//공지사항 리스트
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticelist", noticelist);
		mv.addObject("total_count", total_count);
		mv.addObject("pg", page);
		mv.addObject("all_page", all_page);
		mv.addObject("block", block);
		mv.addObject("from_page", from_page);
		mv.addObject("to_page", to_page);
		mv.setViewName("notice.noticeList");
		
		return mv;

/*
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

		

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		List<Notice_DTO> noticeList = noticeDao.listNotice(page, field, query);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";*/
	}

}
