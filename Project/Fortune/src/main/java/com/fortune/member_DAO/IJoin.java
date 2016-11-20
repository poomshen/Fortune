package com.fortune.member_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.Dept_DTO;
import com.fortune.Table_DTO.Jobtitle_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;

public interface IJoin {

	//여기는 함수 선언만 하는곳
	int insertMember(Join_DTO joinDto);
	int deleteMember(String id);
	int updateMember(Join_DTO joinDto);
	Join_DTO memberInfo(Join_DTO joinDto);
	Join_DTO login(Join_DTO joinDto);
	ArrayList<Dept_DTO> searchDept();
	ArrayList<Team_DTO> searchTeam();
	ArrayList<Jobtitle_DTO> searchTitle();
	
	//회원가입 유효성검사
	Join_DTO idchk(String user_id);
}
