
package com.fortune.join_Controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Chart_Data_DTO;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.Table_DTO.Team_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.chart_DAO.IChart;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.Pie_Data_DTO;
import com.fortune.function_DTO.Schedule_AlarmList_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.function_DTO.Select_Collabo_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.name_Controller.HomeController;
import com.fortune.notice_DAO.INotice;
import com.fortune.password_Service.PassWord_Service;
import com.fortune.request_DAO.ProDao;

@Controller
public class MemberController {
	/* 
	작성자  : 김지현
	최초작업일 : 2016/11/17
	최종수정일 : 2016/12/10
	작업내용 : 회원가입 후 첫 화면으로 이동하는 컨트롤러
	*/	
	@Autowired
	public SqlSession sqlsession;
	
	
	@RequestMapping("/JoinSubmit.htm")
	public String addMember(Join_DTO dto){
		
		System.out.println("MemberController/addMember함수");
		
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
	
		dao.insertMember(dto);

		return "redirect:index.htm";
		
	}

	/* 
	작성자  : 김지현
	최초작업일 : 2016/11/17
	최종수정일 : 2016/12/10
	작업내용 : 로그인 후 첫 화면으로 이동
	수정추가 : 이예지 2016-11-24 로그인했을시 알림 db 체크 
	수정추가 : 이성준 2016-11-26 로그인 했을시 자신 참조 프로젝트*/
	@RequestMapping(value="/FortuneMain.htm", method=RequestMethod.GET)
	public String loginSubmit(HttpSession session ,Authentication authentication,Model model){
		System.out.println("MemberController/loginSubmit함수");
		
		UserDetails details = (UserDetails)authentication.getPrincipal();
		String user_id = details.getUsername();
		
		Join_DTO  result = new Join_DTO();
		IJoin dao = sqlsession.getMapper(IJoin.class);
		result = dao.searchMember(user_id);
		
		//권한이 ROLE_NOUSER이면 로그인 막기(추가작업 : 김중완)
		if(result.getRole_no() == 5){
			HomeController.homeindex = 1;
			model.addAttribute("msg", 1);
			return "redirect:index.htm";
		}
		
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		session.setAttribute("info", result);
		if( result.getRole_no() == 2 ){
			List<Select_Collabo_DTO> collabo = proDao.selectCollaboList2(result.getDept_no());
			session.setAttribute("collabo", collabo);
			List<Select_Collabo_DTO> finishCollabo = proDao.finishCollaboList2(result.getDept_no());
			session.setAttribute("finishCollabo", finishCollabo);
		}else{
			//추가 사항
			List<Select_Collabo_DTO> collabo = proDao.selectCollaboList(result.getUser_id());
			session.setAttribute("collabo", collabo);
			List<Select_Collabo_DTO> finishCollabo = proDao.finishCollaboList(result.getUser_id());
			session.setAttribute("finishCollabo", finishCollabo);
		}

		
		//추가사항  
		//로그인했을때 알림 체크한뒤 해당 알림 리스트를 session에 저장
		
		IAlarm adao = sqlsession.getMapper(IAlarm.class);
		
		List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
		
		alist = adao.checkAlarmAll(user_id);
		
		All_Alarm_DTO tatalCount = adao.totalCount(user_id);
		
		session.setAttribute("alarm", alist);
		session.setAttribute("totalCount", tatalCount.getTotal_count());	
		
		//일정 알림 (작성자 : 이예지)
		List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
		sch_alist  = adao.checkScheduleAlarm(user_id);
		session.setAttribute("sch_alist", sch_alist);
					
		//공지사항 최신글 뽑는 부분 (추가 작업 : 김중완)
		INotice notice_dao = sqlsession.getMapper(INotice.class);
		List<Notice_DTO> nlist = notice_dao.mainListNotice();
		model.addAttribute("nlist", nlist);

		return "home.main";
	}
	
	
	
	
	@RequestMapping("/logOut.htm")
	public String logOut(HttpSession session){
		System.out.println("MemberController/logOut함수");
		
		session.invalidate();
		//System.out.println("로그아웃 성공");
		
		return "redirect:index.htm";
	}
	
	@RequestMapping("/deleteMemember.htm")
	public String deleteMemberView(HttpServletRequest request){
		System.out.println("MemberController/deleteMemberView함수");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		String user_id = request.getParameter("user_id");
		dao.deleteMember(user_id);
		
		return "redirect:adminusers.htm";
	}
	
	@RequestMapping("/updateMember.htm")
	public String updateMemberView(HttpSession session, Model model){
		
		System.out.println("MemberController/updateMemberView함수");
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		
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
		
		model.addAttribute("check","10");
		
		return "home.edit";
		
	}
		
	@RequestMapping(value="/updateConfirm.htm", method=RequestMethod.POST)
	public String updateMemberSubmit(Join_DTO dto, Model model, HttpSession session){
		
		System.out.println("MemberController/updateMemberSubmit함수");
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		int check = dao.updateMember(dto);
		
		Join_DTO  result = new Join_DTO();
		result = dao.searchMember(dto.getUser_id());
		session.setAttribute("info", result);
		
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
		
		if(check > 0){
			model.addAttribute("check","1");
		}else{
			model.addAttribute("check","0");
		}
		
		return "home.edit";
	}
	
	//id search page이동 컨트롤러
	@RequestMapping("/searchpage.htm")
	public String idSearchpage(){
		System.out.println("MemberController/idSearchpage함수");
		
		return "searchpage";
	}
}
