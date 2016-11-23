package com.fortune.fileroom_Controller;

import java.util.List;

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
	public ModelAndView mainFile(String pg){
		System.out.println("mainFile 而⑦듃濡ㅻ윭");
		
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		int page = 1;
		String str_pg = pg;
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		int row_size = 9;

		int total_count = fileromm_DAO.countFile();	//file 媛쒖닔
		System.out.println("totalcount : " + total_count);

		// ... 紐⑸줉
		int all_page = (int) Math.ceil(total_count / (double) row_size); // �럹�씠吏��닔
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("�럹�씠吏��닔 : " + all_page);

		int block = 5; // �븳�럹�씠吏��뿉 蹂댁뿬以� 踰붿쐞 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int from_page = ((page - 1) / block * block) + 1; // 蹂댁뿬以� �럹�씠吏��쓽 �떆�옉
		// ((1-1)/10*10)
		int to_page = ((page - 1) / block * block) + block; // 蹂댁뿬以� �럹�씠吏��쓽 �걹
		if (to_page > all_page) { // �삁) 20>17
			to_page = all_page;
		}

		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page);	//file 由ъ뒪�듃
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("total_count", total_count);
		mv.addObject("pg", page);
		mv.addObject("all_page", all_page);
		mv.addObject("block", block);
		mv.addObject("from_page", from_page);
		mv.addObject("to_page", to_page);
		mv.setViewName("fileView.file_test");
		
		return mv;
	}
}
