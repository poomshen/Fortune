package com.fortune.organization_Controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.organization_DAO.IOrganization;

@Controller
public class orgController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/dept.htm")
	public String deptshow(){
		System.out.println("부서 view단 이동");
		return "business.business";
	}
	
	@RequestMapping("/deptinfo.ajax")
	public @ResponseBody ArrayList<Join_DTO> deptinfo(int dept_no){
		System.out.println(dept_no);
		System.out.println("같은 부서 리스트 쫙 뽑을거");
		IOrganization dao = sqlSession.getMapper(IOrganization.class);
		ArrayList<Join_DTO> deptmember = dao.showdept(dept_no);
		
		return deptmember;
	}
	
}
