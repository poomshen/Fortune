/*
* @Filename : MemberController
* @Date : 2016.11.17
* @Author : 김지현
* @Desc : 회원가입/정보수정/탈퇴 컨트롤러 */

package com.fortune.join_Controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.password_Service.PassWord_Service;

@Controller
public class MemberController {
	
	@Autowired
	public SqlSession sqlsession;
		
	@RequestMapping("/JoinSubmit.htm")
	public String addMember(Join_DTO dto){
		System.out.println("join submit 버튼 눌렀음");
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.insertMember(dto);
		
		System.out.println("id : " + dto.getUser_id());
		System.out.println("pwd : " + dto.getUser_password());
		
		return "redirect:index.htm";
	}
	
	
	
	@RequestMapping(value="/loginSubmit.htm", method=RequestMethod.GET)
	public String loginSubmit(HttpSession session ,Authentication authentication ){
		System.out.println("로그인 버튼 눌렀고요");
		UserDetails details = (UserDetails)authentication.getPrincipal();
		String user_id = details.getUsername();
		
		Join_DTO  result = new Join_DTO();
		IJoin dao = sqlsession.getMapper(IJoin.class);
		result = dao.searchMember(user_id);
		System.out.println("login dao 동작 완료");
				
			
		session.setAttribute("info", result);
			
			
		return "home.main";
	
	}
	
	@RequestMapping("/logOut.htm")
	public String logOut(HttpSession session){
		
		session.invalidate();
		System.out.println("로그아웃 성공");
		
		return "redirect:index.htm";
	}
	
	@RequestMapping("/deleteMemember.htm")
	public String deleteMemberView(HttpSession session){
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		Join_DTO dto = (Join_DTO)session.getAttribute("info");
		System.out.println("id값 : "+dto.getUser_id());
		dao.deleteMember(dto.getUser_id());
		
		System.out.println("삭제완료!!~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		return "redirect:index.htm";
		
	}
	
	@RequestMapping("/updateMember.htm")
	public String updateMemberView(HttpSession session){
		
		System.out.println("id값 받아서 edit view단 보여줄거임");
		Join_DTO dto = (Join_DTO) session.getAttribute("info");
		
		System.out.println("dto값이 뭔데 그러냐 " + dto);
	
		System.out.println("id : " + dto.getUser_id());
		
		return "home.edit";
		
	}
		
	@RequestMapping(value="/updateConfirm.htm", method=RequestMethod.POST)
	public String updateMemberSubmit(Join_DTO dto){
		
		System.out.println("update Controller 왔음~!~!~!");
		PassWord_Service passWord_Service = new PassWord_Service();
		dto.setUser_password(passWord_Service.encode(dto.getUser_password()));
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.updateMember(dto);
		
		return "home.main";
	}
	
	
}
