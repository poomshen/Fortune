package com.fortune.authority_Controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.authority_DAO.IAuthority;

@Controller
public class Authority_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/authority.htm")
	public ModelAndView mainAuthority(){
		System.out.println("mainAuthority 컨트롤러");
		
		IAuthority authority_DAO = sqlsession.getMapper(IAuthority.class);
		List<Join_DTO> list = authority_DAO.listUsersAuthority();
		System.out.println(list);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("admin.authority");
		return mv;
	}
}
