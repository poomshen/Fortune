package com.fortune.admin_Controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.organization_DAO.IOrganization;


@Controller
public class AdminUsers_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/adminusers.htm")
	public String adminUsers(Model model){
		System.out.println("userUpdate 컨트롤러");
		
		ArrayList<Dept_DTO> ddto = new ArrayList<Dept_DTO>();
		IJoin join_dao = sqlsession.getMapper(IJoin.class);
		ddto = join_dao.searchDept();
		model.addAttribute("dept", ddto);
		
		IOrganization organization_dao = sqlsession.getMapper(IOrganization.class);
		ArrayList<Join_DTO> jdto = organization_dao.usersDeptNull();
		model.addAttribute("deptlist", jdto);
		
		return "admin.useredit";
	}
}