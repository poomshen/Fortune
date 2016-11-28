package com.fortune.organization_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Team_DTO;

public interface IOrganization {

	public ArrayList<Join_DTO> showdept(int dept_no, int team_no);
	public ArrayList<Team_DTO> showteam(int dept_no);
}
