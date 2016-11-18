package com.fortune.request_Controller;

import java.io.IOException;
import java.sql.SQLException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.request_Service.ProService;


@Controller

public class ProController {

	@Autowired
	private ProService proservice;


	@RequestMapping("/writerequest.htm")
	public String writeForm() {
			System.out.println("여기에 들어갈까나 ?");
		return "request.writeRequest";

	}

	// 프로젝트를 요청해주는 클래스 이다.
	@RequestMapping(value = "writerequest.htm", method = RequestMethod.POST)
	public String regRequest(Request_DTO n, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {

		try {
			// 실DB저장
			proservice.regRequest(n, request);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:requestList.htm";

	}

	// 요청한 프로젝트들을 리스트로 담아서 뿌려주는 역할을 해준다.
	@RequestMapping("requestList.htm") // /customer/notice.htm
	public String getRequest(String pg, String f, String q, Model model) throws ClassNotFoundException, SQLException {

		List<Request_DTO> list = proservice.getRequest(pg, f, q);
		model.addAttribute("list", list); // 자동 forward
		
		return "request.requestList";

	}

	// 글상세보기
	@RequestMapping("ProDetail.htm")
	public String ProDetail(String collabo_req_index, Model model) throws ClassNotFoundException, SQLException {

		Request_DTO proDto = proservice.ProDetail(collabo_req_index);
		model.addAttribute("list", proDto);
		System.out.println(proDto.toString());

		// Tiles
		return "cen.proDetail";
		// View

	}
	
	//글삭제 하기
	 @RequestMapping("proDel.htm")
	 public String ProDel(String collabo_req_index) throws ClassNotFoundException,
	   SQLException {
	 proservice.ProDel(collabo_req_index);
	 
	  return "redirect:requestList.htm"; //리스트 화면 (controller 타서 데이터 출력)
	 }
	 
	//수락 하기
	 @Transactional
	@RequestMapping("accept.htm")
		 public String Accept(String collabo_req_index) throws ClassNotFoundException,
		   SQLException {
			 System.out.println("수락했다.");
		 proservice.Accept(collabo_req_index);
		 
		  return "redirect:writeresponse.htm"; //리스트 화면 (controller 타서 데이터 출력)
		 }	
		
	//거절 하기
		 @RequestMapping("refuse.htm")
		 public String Refuse(String collabo_req_index) throws ClassNotFoundException,
		   SQLException {
			 System.out.println("거절했다.");
		 proservice.Refuse(collabo_req_index);
		 
		  return "redirect:requestList.htm"; //리스트 화면 (controller 타서 데이터 출력)
		 }	 	
		 
		
	/////////////////////////////////////////////////////////////////////////
		 
		// 프로젝트를 요청해주는 클래스 이다.
			@RequestMapping("/writeresponse.htm")
			public String writeResponse() {
				System.out.println("이쪽으로 왔다 해도 POST는 무슨뜻인지 몰라서 그냥 가는걸지도 몰라요");
				return "request.writeResponse";

			}
		 
		 
		// 프로젝트를 요청해주는 클래스 이다.
			@RequestMapping(value = "writeresponse.htm", method = RequestMethod.POST)
			public String regResponse(With_DTO n)
					throws IOException, ClassNotFoundException, SQLException {
					System.out.println("과연 이곳으로 오는가?");
				System.out.println(n.toString());
				
					// 실DB저장
				proservice.regResponse(n);
				
				return "redirect:requestList.htm";

			}
		 
		 
		 
	
}
