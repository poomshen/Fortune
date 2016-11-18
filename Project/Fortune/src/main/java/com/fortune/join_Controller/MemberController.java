/*
* @Filename : MemberController
* @Date : 2016.11.17
* @Author : 김지현
* @Desc : 회원가입/정보수정/탈퇴 컨트롤러 */

package com.fortune.join_Controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;

@Controller
public class MemberController {
	
	@Autowired
	public SqlSession sqlsession;
		
	@RequestMapping("/JoinSubmit.htm")
	public String addMember(Join_DTO dto){
		System.out.println("join submit 버튼 눌렀음");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.insertMember(dto);
		
		System.out.println("id : " + dto.getId());
		System.out.println("pwd : " + dto.getPwd());
		
		return "redirect:index.htm";
	}
	
	
	
	@RequestMapping(value="/loginSubmit.htm", method=RequestMethod.POST)
	public String loginSubmit(HttpSession session,Join_DTO dto){
		System.out.println("로그인 버튼 눌렀고요");
		
		Join_DTO result = new Join_DTO();
	
		IJoin dao = sqlsession.getMapper(IJoin.class);
		result = dao.login(dto);
		System.out.println("login dao 동작 완료");
		//System.out.println("result값 : " + result);
		if(result == null){
			System.out.println("로그인 실패");
			
			return "redirect:index.htm";
		}else{
			System.out.println("로그인 성공!!!!!!!");			
			
			session.setAttribute("id", dto.getId());
			
			//System.out.println("result값 : "+result);
			
			return "home.main";
		}
		
	
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
		
		System.out.println("id값 : "+session.getAttribute("id"));
		dao.deleteMember((String) session.getAttribute("id"));
		System.out.println("삭제할 id :" + session.getAttribute("id") );
		System.out.println("삭제완료!!~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		return "redirect:index.htm";
		
	}
	/*
	@RequestMapping("/updateMember.htm")
	public String updateMemberView(Join_DTO dto, HttpSession session){
		
		System.out.println("id값 전달하고난 컨트롤러~_~");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);	
		System.out.println("id : " + dto.getId());
		session.setAttribute("info", dao.memberInfo(dto));
		return "updateInfo";
		
	}
		
	@RequestMapping(value="/updateConfirm.htm", method=RequestMethod.POST)
	public String updateMemberSubmit(Join_DTO dto){
		
		System.out.println("update Controller 왔음~!~!~!");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		dao.updateMember(dto);
		
		return "loginOk";
	}*/

}
