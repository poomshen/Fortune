/*
작성자 : 이예지
최초작업일 : 2016/11/30
최종수정일 : 2016/11/30
작업내용: chart의 데이터를 가져올 dao interface
*/
package com.fortune.chart_DAO;


import java.util.List;

import com.fortune.Table_DTO.Chart_Data_DTO;



public interface IChart {
	//전체 프로젝트 차트 가져오기 
	public List<Chart_Data_DTO> selectChartAll();	
	
	//꺾은선 그래프 나타낼 차트
	public List<Chart_Data_DTO> selectChart(int collabo_no);
	

}
