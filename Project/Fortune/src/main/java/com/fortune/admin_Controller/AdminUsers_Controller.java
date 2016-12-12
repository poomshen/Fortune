/*
작성자 : 김중완
최초 작업일 : 2016/11/28
최종 수정일 : 2016/11/28
*/
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
	
	//관리자 사원 정보
	@RequestMapping(value="/adminusers.htm")
	public String adminUsers(Model model){
		
		System.out.println("AdminUsers_Contorller/adminUsers함수 ");
		
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
