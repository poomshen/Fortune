package com.fortune.notice_Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.fileroom_DAO.IFileRoom;
import com.fortune.notice_DAO.INotice;

@Controller
public class NoticeSearch_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/noticeSearch.htm", method=RequestMethod.GET)
	public ModelAndView searchFile(HttpServletRequest request){
		
		System.out.println("NoticeSearch_Controller를 탑니다~");
		String selectvalue = request.getParameter("selectvalue");
		String searchvalue = request.getParameter("searchvalue");
		String pg = request.getParameter("pg");
		System.out.println("selectvalue : "+ selectvalue);
		System.out.println("searchvalue : "+ searchvalue);
		System.out.println("pg : "+ pg);
		
		int page = 1;
		String str_pg = pg;
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		int row_size = 10;
		int total_count = 0;
		
		INotice noticeSearchDao = sqlSession.getMapper(INotice.class);
		List<Notice_DTO> noticelist = null;
		
		if(selectvalue.equals("notice_title")){
			System.out.println("notice_title 문");
			noticelist = noticeSearchDao.searchTitleListNotices(searchvalue, page);
			total_count = noticeSearchDao.countTitleListNotices(searchvalue);
		}
		if(selectvalue.equals("notice_text")){
			System.out.println("notice_text 문");
			noticelist = noticeSearchDao.searchTextListNotices(searchvalue, page);
			total_count = noticeSearchDao.countTextListNotices(searchvalue);
		}
		
		System.out.println("totalcount : " + total_count);

		// ... 목록
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
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

		ModelAndView mv = new ModelAndView();
		mv.addObject("noticelist", noticelist);
		mv.addObject("selectvalue", selectvalue);
		mv.addObject("searchvalue", searchvalue);
		mv.addObject("total_count", total_count);
		mv.addObject("pg", page);
		mv.addObject("all_page", all_page);
		mv.addObject("block", block);
		mv.addObject("from_page", from_page);
		mv.addObject("to_page", to_page);
		mv.setViewName("notice.noticeSearchList");
		
		return mv;
	}
}
