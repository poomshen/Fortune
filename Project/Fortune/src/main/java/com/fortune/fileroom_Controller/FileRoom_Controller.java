package com.fortune.fileroom_Controller;

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
public class FileRoom_Controller {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/mainfile.htm")
	public ModelAndView mainFile(HttpServletRequest request){
		System.out.println("mainFile 컨트롤러");
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));
		System.out.println("collabo_no : " + collabo_no);
		String pg = request.getParameter("pg");
		System.out.println("pg : " + pg);
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		int page = 1;
		String str_pg = pg;
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		int row_size = 12;

		int total_count = fileromm_DAO.countFile(collabo_no);
		System.out.println("totalcount : " + total_count);

		int all_page = (int) Math.ceil(total_count / (double) row_size);
		System.out.println("all_page : " + all_page);

		int block = 5;
		int from_page = ((page - 1) / block * block) + 1;
		int to_page = ((page - 1) / block * block) + block;
		if (to_page > all_page) {
			to_page = all_page;
		}

		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page, collabo_no);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("total_count", total_count);
		mv.addObject("pg", page);
		mv.addObject("all_page", all_page);
		mv.addObject("block", block);
		mv.addObject("from_page", from_page);
		mv.addObject("to_page", to_page);
		mv.addObject("collabo_no", collabo_no);
		mv.setViewName("fileView.file3");
		
		return mv;
	}
}
