package com.fortune.authority_DAO;

import java.util.List;

import com.fortune.Table_DTO.Join_DTO;

public interface IAuthority {
	//Users 권한
	public List<Join_DTO> listUsersAuthority();
	//권한 변경
	public int updateAuthority(String user_id, int role_no);
}
