package com.fortune.organization_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;

public interface IOrganization {

	public ArrayList<Join_DTO> showdept(int dept_no, int team_no);
	public ArrayList<Team_DTO> showteam(int dept_no);
	
	//관리자 사원 수정 할때 사원 정보 (추가작성 : 김중완)
	public ArrayList<Join_DTO> showdeptadmin(int dept_no);
	//부서 NULL(회원가입 한 사원) (추가작성 : 김중완)
	ArrayList<Join_DTO> usersDeptNull();
}
