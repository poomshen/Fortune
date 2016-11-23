package com.fortune.organization_Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.organization_DAO.IOrganization;

@Controller
public class orgController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/dept.htm")
	public String deptshow(HttpSession session,Model model){
		System.out.println("부서 view단 이동");
		
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		int dept_no = dto.getDept_no();
		
		IOrganization dao = sqlSession.getMapper(IOrganization.class);
		ArrayList<Join_DTO> deptmember = dao.showdept(dept_no);
/*
		for(int i=0; i<deptmember.size(); i++){
			System.out.println("해당 아이디값 : "+ deptmember.get(i));
		}*/
		model.addAttribute("deptlist", deptmember);
		
		return "business.business";
	}
	/*
	@RequestMapping("/deptinfo.ajax")
	public @ResponseBody ArrayList<Join_DTO> deptinfo(int dept_no){
		System.out.println(dept_no);
		System.out.println("같은 부서 리스트 쫙 뽑을거");
		IOrganization dao = sqlSession.getMapper(IOrganization.class);
		ArrayList<Join_DTO> deptmember = dao.showdept(dept_no);
		
		return deptmember;
	}
	*/
}
