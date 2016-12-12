package com.fortune.authority_Controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Role_DTO;
import com.fortune.authority_DAO.IAuthority;
import com.fortune.role_DAO.IRole;

@Controller
public class Authority_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/authority.htm")
	public ModelAndView mainAuthority(){
		System.out.println("Authority_Controller/mainAuthority함수");
		
		IAuthority authority_DAO = sqlsession.getMapper(IAuthority.class);
		List<Join_DTO> authorityList = authority_DAO.listUsersAuthority();
		System.out.println(authorityList);
		
		IRole role_DAO = sqlsession.getMapper(IRole.class);
		List<Role_DTO> roleList = role_DAO.listRole();
		System.out.println(roleList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("authorityList", authorityList);
		mv.addObject("roleList", roleList);
		mv.setViewName("admin.authority");
		return mv;
	}
}
