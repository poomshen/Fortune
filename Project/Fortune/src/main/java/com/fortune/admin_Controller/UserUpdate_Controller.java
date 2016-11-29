package com.fortune.admin_Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Join_DTO;


@Controller
public class UserUpdate_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/userupdate.htm")
	public ModelAndView userUpdate(Join_DTO dto){
		System.out.println("userUpdate 컨트롤러");
		
		/*IAuthority authority_DAO = sqlsession.getMapper(IAuthority.class);
		List<Join_DTO> authorityList = authority_DAO.listUsersAuthority();
		System.out.println(authorityList);
		
		IRole role_DAO = sqlsession.getMapper(IRole.class);
		List<Role_DTO> roleList = role_DAO.listRole();
		System.out.println(roleList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("authorityList", authorityList);
		mv.addObject("roleList", roleList);*/
		
		/*IJoin dao = sqlsession.getMapper(IJoin.class);
		
		dao.insertMember(dto);*/
		ModelAndView mv = new ModelAndView();
		
		/*ArrayList<Dept_DTO> ddto = new ArrayList<Dept_DTO>();
		IJoin dao = sqlsession.getMapper(IJoin.class);
		ddto = dao.searchDept();
		mv.addObject("dept", ddto);
		
		//팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IJoin tdao = sqlsession.getMapper(IJoin.class);
		tdto = dao.searchTeam();
		mv.addObject("team", tdto);
		
		//직함 리스트 보여주는 부분
		ArrayList<Jobtitle_DTO> jdto = new ArrayList<Jobtitle_DTO>();
		IJoin jdao = sqlsession.getMapper(IJoin.class);
		jdto = dao.searchTitle();
		mv.addObject("position", jdto);*/
		

		mv.setViewName("admin.useredit");
		return mv;
	}
}
