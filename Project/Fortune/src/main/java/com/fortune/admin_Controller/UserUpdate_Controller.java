package com.fortune.admin_Controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.password_Service.PassWord_Service;

@Controller
public class UserUpdate_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	/*@RequestMapping(value="/userupdateadmin.ajax")
	public String userUpdateAdmin(Join_DTO dto, Model model){
		System.out.println("userUpdateAdmin 컨트롤러");
		System.out.println(dto);
		
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		int result = dao.updateMemberAdmin(dto);
		
		if(result > 0){
			model.addAttribute("msg", "수정 성공");
		}else{
			model.addAttribute("msg", "수정 실패");
		}

		Join_DTO join_DTO = dao.searchMember(dto.getUser_id());
		model.addAttribute("join_DTO", join_DTO);
		
		
		ArrayList<Dept_DTO> ddto = new ArrayList<Dept_DTO>();
		ddto = dao.searchDept();
		model.addAttribute("deptselect", ddto);

		//팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		tdto = dao.searchTeam();
		model.addAttribute("teamselect", tdto);
		
		//직함 리스트 보여주는 부분
		ArrayList<Jobtitle_DTO> jdto = new ArrayList<Jobtitle_DTO>();
		jdto = dao.searchTitle();
		model.addAttribute("positionselect", jdto);
		
		return "/WEB-INF/views/admin/editDiv.jsp";
	}*/
}
