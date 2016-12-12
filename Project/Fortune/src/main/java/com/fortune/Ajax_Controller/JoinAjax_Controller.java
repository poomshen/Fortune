package com.fortune.Ajax_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.fullcalendar_DAO.IFullCalendar;
import com.fortune.function_DTO.Schedule_Work_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.member_DAO.IJoin;
import com.fortune.organization_DAO.IOrganization;

@Controller
public class JoinAjax_Controller {

	@Autowired
	public SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping("/idchk.ajax")
	public @ResponseBody String idchk(Join_DTO dto){
		
		System.out.println("JoinAjax_Contoroller/idchk함수");
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		Join_DTO join = dao.idchk(dto.getUser_id());
		//System.out.println(join.getUser_id());
		if(join != null){
			return "yes";
		}else{
			return "no";
		}
	}
	
	@RequestMapping("/pwdchk.ajax")
	public @ResponseBody String pwdchk(@RequestParam(value="user_password") String user_password, @RequestParam(value="user_password_chk") String user_password_chk){
			
		System.out.println("JoinAjax_Contoroller/pwdchk함수");
		
		if(user_password.equals(user_password_chk)){
			return "ok";
		}else{
			return "fail";
		}
	}
	
	
	
}
