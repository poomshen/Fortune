package com.fortune.chart_Controller;

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

import com.fortune.Table_DTO.Chart_Data_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.chart_DAO.IChart;
import com.fortune.function_DTO.Pie_Data_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.member_DAO.IJoin;

@Controller
public class Chart_Controller {
	@Autowired
	private SqlSession sqlsession;
	

	
	
	@RequestMapping(value="selectChart.htm", method = RequestMethod.POST)
    public String selectChart(@RequestParam(value="project_num") int project_num,@RequestParam(value="project_name") String project_name,HttpSession session,Model model)
            throws ClassNotFoundException, SQLException{
	
		
	      System.out.println("Chart_Controller/selectChart함수");
	      
			//메뉴에 비동기 차트 가져오기
			IChart cdao = sqlsession.getMapper(IChart.class);
			List<Chart_Data_DTO> each_clist = new ArrayList<Chart_Data_DTO>();
			
			each_clist=cdao.selectChart(project_num);
			ArrayList<String> chart_x =new ArrayList<String>();
			ArrayList<Float> chart_y =new ArrayList<Float>();
		
			for(int i=0;i<each_clist.size();i++){
				
		
				chart_x.add(each_clist.get(i).getChart_date().substring(0, 10).replace("-", ""));
				chart_y.add(each_clist.get(i).getChart_progress());
				
			
			}
			

			
			model.addAttribute("eachChart_x",chart_x);
			model.addAttribute("eachChart_y",chart_y);
			model.addAttribute("project_num",project_num);
			model.addAttribute("project_name",project_name);
			
			

	      
			return "chart";
	      
	}

}
