package com.fortune.organization_DAO;

import java.util.ArrayList;

import com.fortune.Table_DTO.Join_DTO;

public interface IOrganization {

	public ArrayList<Join_DTO> showdept(int dept_no);
}
