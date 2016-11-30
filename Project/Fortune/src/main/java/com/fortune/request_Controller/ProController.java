package com.fortune.request_Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.request_DAO.ProDao;
import com.fortune.request_Service.ProService;




@Controller

public class ProController {

	@Autowired
	private ProService proservice;

	 @Autowired
	 private SqlSession sqlSession;
	
	
	@RequestMapping("/writerequest.htm")
	public String writeForm(Model model) throws ClassNotFoundException, SQLException {
			System.out.println("여기에 들어갈까나 ?");
			List<Join_DTO> list = proservice.listEffect(model); //수신자를 부르기 위해서 사용하였다. 
			model.addAttribute("list", list);
		return "request.writeRequest";

	}

	// 프로젝트를 요청해주는 클래스 이다.
	@RequestMapping(value = "writerequest.htm", method = RequestMethod.POST)
	public String regRequest(Request_DTO n, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {
			
		System.out.println("writeRequest.htm 컨트롤러 start");
		try {
			//추가 사항 req_no 바꿔주기
			
			
			// 실DB저장
			proservice.regRequest(n, request);
			
			Alarm_DTO adto = new Alarm_DTO();
			
			IAlarm alarmDAO =  sqlSession.getMapper(IAlarm.class);
			System.out.println("수신자 아이디 :"+n.getCollabo_req_ID());
			
			adto.setUser_id(n.getCollabo_req_ID());
        	adto.setWork_type("1");

        	alarmDAO.insertAlarm(adto);

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:listReplyRequest.htm";

	}

	// 만든 목적: 발신자가 보낸 것을 리스트로 보여주는 클래스입니다,
	// 만든 날짜: 2016-11-28
	 @Transactional
	@RequestMapping("requestList.htm") // /customer/notice.htm
	public String requestList(String pg, String f, String q, String st,HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {

		
		List<Request_DTO> list = proservice.getRequest(pg, f, q, st, session);
		System.out.println("아아ㄷ아"+st);
		System.out.println("미"+collabo_req_index);
		model.addAttribute("list", list); // 자동 forward
		
		
		
		
		return "request.requestList";

	}
	// 만든 목적: 발신자가 보낸 것 수신자가 보는 리스트로 보여주는 클래스입니다,
	// 만든 날짜: 2016-11-28
	 @Transactional
	@RequestMapping("listReplyRequest.htm") // /customer/notice.htm
	public String listReplyRequest( String pg, String f, String q,String st, HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {
		
			
		List<Request_DTO> list = proservice.listReplyRequest(pg, f, q,st, session);
		System.out.println("아아ㅇ아"+st);
		model.addAttribute("list", list); // 자동 forward
		System.out.println("미"+collabo_req_index);
		System.out.println(collabo_req_index);
		
		
		
		return "request.requestList";

	}
	//전체
	 @Transactional
	@RequestMapping("listallRequest.htm") // /customer/notice.htm
	public String listallRequest( String pg, String f, String q, String st,HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {
		
		System.out.println("아아ㄴ아"+st);
		List<Request_DTO> list = proservice.listallRequest(pg, f, q, st, session);
		System.out.println("커피를 타보자");
		System.out.println("미"+collabo_req_index);
		model.addAttribute("list", list); // 자동 forward
		
		
		return "request.requestList";

	}
	
	/*//test 대기 수락 거절 클래스
	@RequestMapping("kindState.htm")
	public String kindState(String collabo_req_state, String pg, String f, String q,HttpSession session , Model model) throws ClassNotFoundException, SQLException {

		 proservice.listallRequest(pg, f, q, session); //전체
		 proservice.kindState(collabo_req_state);

		// Tiles
		return "request.requestList";
		// View

	}*/

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
		 System.out.println("삭제 인덱스"+collabo_req_index);
	 proservice.ProDel(collabo_req_index);
	 
	  return "request.requestList"; //리스트 화면 (controller 타서 데이터 출력)
	 }
	 
	//수락 하기 눌렀을 경우 화면 출력
	 @Transactional
	@RequestMapping("accept.htm")
		 public String Accept(String collabo_req_index, Model model) throws ClassNotFoundException,
		   SQLException {
			 System.out.println("수락했다.");
		 Request_DTO proDto = proservice.DetailResponse(collabo_req_index);
		 model.addAttribute("list", proDto);
		 System.out.println("여기는 !!");
		 System.out.println(proDto.toString());
		 
		  return "cen.writeResponse"; //리스트 화면 (controller 타서 데이터 출력)
		 }	
		
	//거절 하기 했을 경우 화면 출력
		 @RequestMapping("refuse.htm")
		 public String Refuse(String collabo_req_text,String collabo_req_index ) throws ClassNotFoundException,
		   SQLException {
			 System.out.println("거절했다.");
		 proservice.Refuse(collabo_req_text,collabo_req_index);
		
		  return "request.requestList"; //리스트 화면 (controller 타서 데이터 출력)
		 }	 	
		 
		
	//협업 요청 게시판 수정화면 보여주는 클래스입니다.
		 @RequestMapping(value = "proEdit.htm", method = RequestMethod.GET)
		 public String proEdit(String collabo_req_index, Model model)
		   throws ClassNotFoundException, SQLException {
		 
			 
			 
			 Request_DTO req_Dto =  proservice.proEdit(collabo_req_index);
			  model.addAttribute("list", req_Dto);	
		 
		  return "request.proEdit";
		 }

	//게시판 실제 수정처리
		 @RequestMapping(value = "proEdit.htm", method = RequestMethod.POST)
		 public String proEdit(Request_DTO n,HttpServletRequest request) throws ClassNotFoundException,
		   SQLException, IOException {
			 System.out.println("일로 타는데?");
			 System.out.println(n.toString() );
			proservice.proEdit(n,request);
		  return "redirect:requestList.htm";
	    	 
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
			public String regResponse(With_DTO n, String collabo_req_index)
					throws IOException, ClassNotFoundException, SQLException {
					System.out.println("과연 이곳으로 오는가?");
				
					System.out.println("dlv:"+ collabo_req_index);
					/*System.out.println(n.toString());*/
					 proservice.regResponse(n, collabo_req_index);
					 proservice.Accept(collabo_req_index);
					// 실DB저장
				
				
				return "redirect:requestList.htm";

			}
		 
		
			// 프로젝트의 협업상태를 보여주는 클래스이다.
			
			@RequestMapping("responseList.htm") // /customer/notice.htm
			public String listResponse( String pg, String f, String q,HttpSession session ,Model model) throws ClassNotFoundException, SQLException {

				List<With_DTO> list = proservice.listResponse( pg, f, q, session);
			
				
				model.addAttribute("list", list); // 리스트 협업상태
				
				
				/*System.out.println("리스트 협업상태 : "+list);*/
				
				return "request.responseList";

			}	
			
			//담당자 선택역할을 하는 클래스입니다.
			 @RequestMapping(value = "insertmanager.htm", method= RequestMethod.GET)
			 public String InsertManager(String collabo_req_index, Model model)
			   throws ClassNotFoundException, SQLException {
			 
				 //아 힘들다..
				 
				 With_DTO req_Dto =  proservice.managerDto(collabo_req_index);
					List<Join_DTO> listmanager = proservice.listManager(model); 
				 
					model.addAttribute("listmanager", listmanager); // 담당자 리스트 
				  model.addAttribute("list", req_Dto);	//협업상태 보여준다.
				  
				 /* System.out.println(req_Dto.toString());
				  System.out.println("담당자 : "+listmanager.toString());*/
				  
				  
			  return "cen.proManager";
			 }
			
			
			
			
			//담당자 선택역할을 한다.
			@RequestMapping( value="insertmanager.htm", method = RequestMethod.POST)
			 public String InsertManager(With_DTO m, String collabo_req_index) throws ClassNotFoundException,
			   SQLException {
				// proservice.ProManager(collabo_req_index);
				 proservice.InsertManager(m);
				/* System.out.println(m.toString()+"흠냐");*/
				 
				  return "redirect:responseList.htm"; //리스트 화면 (controller 타서 데이터 출력)
				
			 }
			
			
			//사용 목적: 다운로드 하는 부분인데 요청 상태에서 제안서나 그런것을 받을 때 사용 되는 클래스이다.	
			// 날짜 일자 :2016-11-25
			 @RequestMapping("download.htm")
			 public void download(String p, String f, HttpServletRequest request,
			   HttpServletResponse response) throws IOException {
				 	
				 proservice.download(p, f, request, response);
				 
			 }
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 /*@RequestMapping(value="/noticeList.htm")
				
			 //만든 목적: 페이징 처리할때 사용하는데 협업 요청 하는데 많은 리스트를 뽑는다 그것을 페이징 처리하기 위해서 위한 클래스입니다.
			 //날짜 일자 :2016-11-26
			 public ModelAndView noticeList(String pg) throws ClassNotFoundException, SQLException {
				
				 
				 
				 return null;
	
				 
			 }*/
}
