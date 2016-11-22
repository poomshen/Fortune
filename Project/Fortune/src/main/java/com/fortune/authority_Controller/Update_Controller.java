package com.fortune.authority_Controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.authority_DAO.IAuthority;

@Controller
public class Update_Controller {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="updateauthority.ajax", method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> updateAuthority(@RequestParam(value="user_id") String user_id,
			@RequestParam(value="role_no") int role_no) throws Exception {
		System.out.println("updateAuthority 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("user_id : " + user_id);
		System.out.println("role_no : " + role_no);
		IAuthority authority_DAO = sqlsession.getMapper(IAuthority.class);
		int row = authority_DAO.updateAuthority(user_id, role_no);
		
		if(row > 0){
			List<Join_DTO> list = authority_DAO.listUsersAuthority();
			result.put("list", list);
			result.put("msg", "수정 성공");
		}else{
			result.put("msg", "수정 실패");
		}
		
		return result;
	}
}
