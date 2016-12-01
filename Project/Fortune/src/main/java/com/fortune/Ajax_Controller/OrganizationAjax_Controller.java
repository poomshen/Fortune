package com.fortune.Ajax_Controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Role_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.member_DAO.IJoin;
import com.fortune.organization_DAO.IOrganization;
import com.fortune.password_Service.PassWord_Service;

@Controller
public class OrganizationAjax_Controller {

	@Autowired
	public SqlSession sqlsession;

	@RequestMapping(value="/deptsearch.ajax", method=RequestMethod.GET)
	public String deptsearch(int dept_no, int team_no, Model model){
		//System.out.println("같은 부서 리스트 쫙 뽑을거");
		
		ArrayList<Join_DTO> dto = new ArrayList<Join_DTO>();
		IOrganization dao = sqlsession.getMapper(IOrganization.class);
		dto = dao.showdept(dept_no,team_no);
		model.addAttribute("deptlist", dto);
		
		// 부서 리스트 보여주는 부분
		ArrayList<Dept_DTO> dto2 = new ArrayList<Dept_DTO>();
		IJoin dao2 = sqlsession.getMapper(IJoin.class);
		dto2 = dao2.searchDept();
		model.addAttribute("dept", dto2);

		// 팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IJoin tdao = sqlsession.getMapper(IJoin.class);
		tdto = tdao.searchTeam();
		model.addAttribute("team", tdto);

		// 직함 리스트 보여주는 부분
		ArrayList<Jobtitle_DTO> jdto = new ArrayList<Jobtitle_DTO>();
		IJoin jdao = sqlsession.getMapper(IJoin.class);
		jdto = jdao.searchTitle();
		model.addAttribute("position", jdto);

		return "/WEB-INF/views/business/orgTable.jsp";
	}
	
	@RequestMapping(value="/deptsearch2.ajax")
	public String deptsearch2(int dept_no, int team_no,Model model){
		ArrayList<Join_DTO> dto = new ArrayList<Join_DTO>();
		IOrganization dao = sqlsession.getMapper(IOrganization.class);
		dto = dao.showdept(dept_no,team_no);
		model.addAttribute("deptlist", dto);
		//System.out.println("ajax 돌았음");

		// 부서 리스트 보여주는 부분
		ArrayList<Dept_DTO> dto2 = new ArrayList<Dept_DTO>();
		IJoin dao2 = sqlsession.getMapper(IJoin.class);
		dto2 = dao2.searchDept();
		model.addAttribute("dept", dto2);

		// 팀 리스트 보여주는 부분
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IJoin tdao = sqlsession.getMapper(IJoin.class);
		tdto = tdao.searchTeam();
		model.addAttribute("team", tdto);

		// 직함 리스트 보여주는 부분
		ArrayList<Jobtitle_DTO> jdto = new ArrayList<Jobtitle_DTO>();
		IJoin jdao = sqlsession.getMapper(IJoin.class);
		jdto = jdao.searchTitle();
		model.addAttribute("position", jdto);

		return "/WEB-INF/views/business/orgTable.jsp";
	}
	
	@RequestMapping(value="/getteam.ajax")
	public @ResponseBody ArrayList<Team_DTO> getteam(int dept_no){
		ArrayList<Team_DTO> tdto = new ArrayList<Team_DTO>();
		IOrganization dao = sqlsession.getMapper(IOrganization.class);
		tdto = dao.showteam(dept_no);
		
		return tdto;
	}

	@RequestMapping(value="/deptsearchadmin.ajax", method=RequestMethod.GET)
	public String deptsearch(int dept_no, Model model){
		//System.out.println("같은 부서 리스트 쫙 뽑을거");
		ArrayList<Join_DTO> dto = new ArrayList<Join_DTO>();
		IOrganization dao = sqlsession.getMapper(IOrganization.class);
		if(dept_no == -1){
			dto = dao.usersDeptNull();
		}else{
			dto = dao.showdeptadmin(dept_no);
		}
		
		model.addAttribute("deptlist", dto);
		
		// 부서 리스트 보여주는 부분
		ArrayList<Dept_DTO> dto2 = new ArrayList<Dept_DTO>();
		IJoin dao2 = sqlsession.getMapper(IJoin.class);
		dto2 = dao2.searchDept();
		model.addAttribute("dept", dto2);

		return "/WEB-INF/views/admin/orgTable.jsp";
	}
	
	@RequestMapping(value="/userinfoadmin.ajax", method=RequestMethod.GET)
	public String userInfoAdmin(HttpServletRequest request, Model model){
		System.out.println("userinfoadmin 컨트롤러");
		String user_id = request.getParameter("user_id");
		System.out.println("user_id : " + user_id);

		IJoin dao = sqlsession.getMapper(IJoin.class);
		Join_DTO join_DTO = dao.searchMember(user_id);
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
		
		//권한 리스트 보여주는 부분
		ArrayList<Role_DTO> rdto = new ArrayList<Role_DTO>();
		rdto = dao.searchRole();
		model.addAttribute("roleselect", rdto);
		
		return "/WEB-INF/views/admin/editDiv.jsp";
	}
	
	@RequestMapping(value="/userupdateadmin.ajax")
	public String userUpdateAdmin(Join_DTO dto, Model model){
		System.out.println("userUpdateAdmin 컨트롤러");
		System.out.println(dto);
		
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.updateMemberAdmin(dto);

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
		
		//권한 리스트 보여주는 부분
		ArrayList<Role_DTO> rdto = new ArrayList<Role_DTO>();
		rdto = dao.searchRole();
		model.addAttribute("roleselect", rdto);
		
		return "/WEB-INF/views/admin/editDiv.jsp";
	}
	
	
	
	
	
	
	
	
	
}
