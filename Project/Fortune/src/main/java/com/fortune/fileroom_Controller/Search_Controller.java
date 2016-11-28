package com.fortune.fileroom_Controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.fileroom_DAO.IFileRoom;

@Controller
public class Search_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/searchfile.htm")
	public ModelAndView searchFile(HttpServletRequest request){
		System.out.println("searchFile 컨트롤러");
		
		String selectvalue = request.getParameter("selectvalue");
		String searchvalue = request.getParameter("searchvalue");
		String pg = request.getParameter("pg");
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));
		
		System.out.println("selectvalue : "+ selectvalue);
		System.out.println("searchvalue : "+ searchvalue);
		System.out.println("pg : "+ pg);
		System.out.println("collabo_no : " + collabo_no);
		
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		List<FileRoom_DTO> list = null;
		int page = 1;
		String str_pg = pg;
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		int row_size = 12;
		int total_count = 0;
		
		if(selectvalue.equals("file_room_name")){
			System.out.println("file_room_name 문");
			list = fileromm_DAO.searchNameListFiles(searchvalue, page, collabo_no);
			total_count = fileromm_DAO.countSearchNameFile(searchvalue, collabo_no);
		}
		if(selectvalue.equals("file_room_date")){
			System.out.println("file_room_date 문");
			list = fileromm_DAO.searchDateListFiles(searchvalue, page, collabo_no);
			total_count = fileromm_DAO.countSearchDateFile(searchvalue, collabo_no);
		}
		
		//View 화면에 뿌려주기 위한 list
		
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
		mv.addObject("list", list);
		mv.addObject("selectvalue", selectvalue);
		mv.addObject("searchvalue", searchvalue);
		mv.addObject("total_count", total_count);
		mv.addObject("pg", page);
		mv.addObject("all_page", all_page);
		mv.addObject("block", block);
		mv.addObject("from_page", from_page);
		mv.addObject("to_page", to_page);
		mv.addObject("collabo_no", collabo_no);
		mv.setViewName("fileView.file2");
		
		return mv;
	}
}
