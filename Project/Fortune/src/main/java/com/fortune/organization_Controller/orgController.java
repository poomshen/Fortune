package com.fortune.organization_Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.organization_DAO.IOrganization;

@Controller
public class orgController {

	@Autowired
	public SqlSession sqlSession;
	
	@Transactional
	@RequestMapping("/dept.htm")
	public String deptshow(HttpSession session,Model model){
		System.out.println("부서 view단 이동");
		
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		int dept_no = dto.getDept_no();
		
		IOrganization dao = sqlSession.getMapper(IOrganization.class);
		ArrayList<Join_DTO> deptmember = dao.showdept(dept_no);
		model.addAttribute("deptlist", deptmember);
		
/*		for(int i=0; i<deptmember.size(); i++){
			System.out.println("해당 아이디값 : "+ deptmember.get(i));
		}*/

		//부서 리스트 보여주는 부분
		ArrayList<Dept_DTO> dto2 = new ArrayList<Dept_DTO>();
		IJoin dao2 = sqlSession.getMapper(IJoin.class);
		dto2 = dao2.searchDept();
		model.addAttribute("dept", dto2);
		
		//팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IJoin tdao = sqlSession.getMapper(IJoin.class);
		tdto = tdao.searchTeam();
		model.addAttribute("team", tdto);
		
		return "business.business";
	}

	
}
