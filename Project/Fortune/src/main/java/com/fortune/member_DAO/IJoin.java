package com.fortune.member_DAO;

import com.fortune.Table_DTO.Join_DTO;

public interface IJoin {

	//여기는 함수 선언만 하는곳
	int insertMember(Join_DTO joinDto);
	int deleteMember(String id);
	int updateMember(Join_DTO joinDto);
	Join_DTO memberInfo(Join_DTO joinDto);
	Join_DTO login(Join_DTO joinDto);
}
