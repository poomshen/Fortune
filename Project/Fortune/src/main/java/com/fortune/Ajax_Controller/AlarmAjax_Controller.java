package com.fortune.Ajax_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Chart_Data_DTO;
import com.fortune.chart_DAO.IChart;
import com.fortune.function_DTO.Select_Alarm_DTO;

@Controller
public class AlarmAjax_Controller {

	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping(value="/totalChart.ajax")
	public @ResponseBody List<Chart_Data_DTO> geId(HttpServletRequest request, Model model){
		System.out.println("totalChart.ajax");
		
		//메뉴에 차트 가져오기(추가작업 : 이예지)
		//pie차트 가져오기 2016/12/08
		IChart cdao = sqlsession.getMapper(IChart.class);
		List<Chart_Data_DTO> clist = new ArrayList<Chart_Data_DTO>();
		
		clist=cdao.selectChartAll();
		System.out.println("clist"+clist.size());
		
		
	
		
		return clist;
	}
	
	

	
}
