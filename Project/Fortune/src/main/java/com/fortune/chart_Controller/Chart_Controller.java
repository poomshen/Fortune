package com.fortune.chart_Controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.function_DTO.Select_Alarm_DTO;

@Controller
public class Chart_Controller {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="selectChart.htm", method = RequestMethod.POST)
    public String newAlarm(@RequestParam(value="chart_type") String chart_type,HttpSession session)
            throws ClassNotFoundException, SQLException{
	
		
	      System.out.println("selectChart.ajax");
	      System.out.println("chart_type : "+chart_type);
	      

	      
	      return "chart";
	      
	}
}
