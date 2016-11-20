package com.fortune.Ajax_Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.member_DAO.IJoin;

@Controller
public class JoinAjax_Controller {

	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping("/idchk.ajax")
	public @ResponseBody String idchk(Join_DTO dto){
		
		System.out.println("id 중복체크할겨");
		System.out.println(dto.getUser_id());
		
		IJoin dao = sqlsession.getMapper(IJoin.class);
		Join_DTO join = dao.idchk(dto.getUser_id());
		//System.out.println(join.getUser_id());
		if(join != null){
			return "yes";
		}else{
			return "no";
		}
	}
}
