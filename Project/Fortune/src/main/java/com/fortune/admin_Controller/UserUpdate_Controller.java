package com.fortune.admin_Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.password_Service.PassWord_Service;

@Controller
public class UserUpdate_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/userupdateadmin.htm")
	public String userUpdateAdmin(Join_DTO dto, Model model){
		System.out.println("userUpdateAdmin 컨트롤러");
		System.out.println(dto);
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.updateMemberAdmin(dto);
		
		return "admin.useredit";
	}
}
