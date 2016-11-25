package com.fortune.authority_Controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Role_DTO;
import com.fortune.authority_DAO.IAuthority;
import com.fortune.role_DAO.IRole;

@Controller
public class Update_Controller {
	private static final Logger logger =  Logger.getLogger(Update_Controller.class);
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
		
		try{
			IAuthority authority_DAO = sqlsession.getMapper(IAuthority.class);
			int row = authority_DAO.updateAuthority(user_id, role_no);
			
			IRole role_DAO = sqlsession.getMapper(IRole.class);
			List<Role_DTO> roleList = role_DAO.listRole();
			System.out.println(roleList);
			
			List<Join_DTO> authorityList = authority_DAO.listUsersAuthority();
			result.put("authorityList", authorityList);
			result.put("roleList", roleList);
			
			if(row > 0){
				result.put("msg", "수정 성공");
			}else{
				result.put("msg", "수정 실패");
			}
		}catch (Exception e) {
			logger.error("[Update_Controller]");
		}
		
		return result;
	}
}
