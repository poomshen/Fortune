package com.fortune.request_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Alarm_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.ProgectName_DTO;
import com.fortune.history_Service.HistoryService;
import com.fortune.req_alarm_DAO.IReqAlarm;
import com.fortune.request_DTO.Passion_DTO;
import com.fortune.request_Service.ProService;


@Controller

public class ProController {

	@Autowired
	private ProService proservice;
	
	@Autowired
	private HistoryService historyService;
	
	 @Autowired
	 private SqlSession sqlSession;
	
	@RequestMapping(value = "/writerequest.htm")
	public String writeForm(Model model) throws ClassNotFoundException, SQLException {
			//성준 추가 16-11-30 초기 헙업 가져오기
			List<ProgectName_DTO> pList = historyService.progetctNameList();
			model.addAttribute("pList", pList);
			int collabo_req_no = historyService.maxReqNo();
			model.addAttribute("collabo_req_no", collabo_req_no);
			
			List<Passion_DTO> list = proservice.listEffect(model); //수신자를 부르기 위해서 사용하였다. 
			
			model.addAttribute("list", list);
			
		return "request.writeRequest";

	}

	   // 프로젝트를 요청해주는 클래스 이다.
	   @RequestMapping(value = "writerequest.htm", method = RequestMethod.POST)
	   public String regRequest(Request_DTO n, HttpServletRequest request,HttpSession session)
	         throws IOException, ClassNotFoundException, SQLException {
	         
	      System.out.println("writeRequest.htm 컨트롤러 start");
	      try {
	         //추가 사항 req_no 바꿔주기
	         
	         
	         // 실DB저장
	         proservice.regRequest(n, request);
	         session.setAttribute("test",n.getCollabo_req_ID());
	         

	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      return "redirect:listReplyRequest.htm";

	   }

	// 만든 목적: 발신자가 보낸 것을 리스트로 보여주는 클래스입니다,
	// 만든 날짜: 2016-11-28
	// 추가 작업: 이예지 알림 new list 불러오기
	@Transactional
	@RequestMapping("requestList.htm") // /customer/notice.htm
	public ModelAndView requestList(String pg, String f, String q, String st,String me,String se, HttpSession session ,String collabo_req_date,Model model) throws ClassNotFoundException, SQLException {
		 
		String rs = "request";
		ModelAndView mv = proservice.getRequest(pg, f, q, st,rs,me,se,collabo_req_date, session);
		
		System.out.println("데이터 변환중:"+ collabo_req_date);
		return mv;
		

	}
	 // 만든 목적 : 대기 수락 거절 을 비동기 처리로 하려면 ajax 태울 곳이 필요하여 만들었습니다.
	 // 만든 날짜 : 2016 -12-02
	 @Transactional
	 @RequestMapping("requestList2.htm") // /customer/notice.htm
	 public ModelAndView requestList2(String pg, String f, String q, String st,String me,String se,HttpSession session, String collabo_req_date,Model model) throws ClassNotFoundException, SQLException {
		 System.out.println("수락,거절등 :"+st);
		 
		 if(st.equals("전체")){
				st = "%%";
		}
		 System.out.println("전체일경우 :"+st);
		 String rs = "cen";
		 ModelAndView mv =proservice.getRequest(pg, f, q, st,rs, me, se,collabo_req_date, session);
		 System.out.println("데이터 변환중:"+ collabo_req_date);
		 return mv;
		 
		 
	 }
	// 만든 목적: 발신자가 보낸 것 수신자가 보는 리스트로 보여주는 클래스입니다,
	// 만든 날짜: 2016-11-28
	 @Transactional
	@RequestMapping("listReplyRequest.htm") // /customer/notice.htm
	public ModelAndView listReplyRequest( String pg, String f, String q,String st,String me,String se, HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {
		
		String rs = "request";
		ModelAndView mv = proservice.listReplyRequest(pg, f, q,st,rs,me,se, session);
		 // 자동 forward
	    session.setAttribute("test1",session.getAttribute("test"));
	     
		
		
		return mv;

	}
	 // ajax 태울 곳
	 @Transactional
	 @RequestMapping("listReplyRequest2.htm") // /customer/notice.htm
	 public ModelAndView listReplyRequest2( String pg, String f, String q,String st,String me,String se, HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {
		 System.out.println("수락,거절등 :"+st);
		 
		 if(st.equals("전체")){
				st = "%%";
		}
		 System.out.println("전체일경우 :"+st);
		 String rs = "cen";
		 ModelAndView mv = proservice.listReplyRequest(pg, f, q,st,rs,me,se, session);
		  // 자동 forward
		 
		 
		 
		 return mv;
		 
	 }
	//전체
	 @Transactional
	@RequestMapping("listallRequest.htm") // /customer/notice.htm
	public String listallRequest( String pg, String f, String q, String st,String me,String se, HttpSession session ,String collabo_req_index,Model model) throws ClassNotFoundException, SQLException {
		
		List<Request_DTO> list = proservice.listallRequest(pg, f, q, st,me,se, session);
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
	 proservice.ProDel(collabo_req_index);
	 
	  return "request.requestList"; //리스트 화면 (controller 타서 데이터 출력)
	 }
	 
	//수락 하기 눌렀을 경우 화면 출력
	
	@RequestMapping("accept.htm")
		 public String Accept(String collabo_req_index,String dept_no, Model model) throws ClassNotFoundException,
		   SQLException {
		 Request_DTO proDto = proservice.DetailResponse(collabo_req_index);
		 model.addAttribute("list", proDto);
		 model.addAttribute("acceptlist", proDto);
		 System.out.println("수락 창");
		 System.out.println(proDto.toString());
		 
		 List<Join_DTO> listmanager = proservice.listManager(dept_no); 
		 model.addAttribute("listmanager", listmanager); // 담당자 리스트 
		 
		  return "cen.writeResponse"; //리스트 화면 (controller 타서 데이터 출력)
		 }	
		
	//거절 하기 했을 경우 화면 출력
		 @RequestMapping("refuse.htm")
		 public String Refuse(String collabo_req_index,String collabo_req_text) throws ClassNotFoundException,
		   SQLException {
			 System.out.println("인덱스:"+collabo_req_index);
			 System.out.println("텍스트:"+collabo_req_text);
			 proservice.Refuse(collabo_req_index,collabo_req_text);
		
		  return "redirect:listReplyRequest.htm"; //리스트 화면 (controller 타서 데이터 출력)
		 }	 	
		 
		
	//협업 요청 게시판 수정화면 보여주는 클래스입니다.
		 @RequestMapping(value = "proEdit.htm", method = RequestMethod.GET)
		 public String proEdit(String collabo_req_index, Model model)
		   throws ClassNotFoundException, SQLException {
		 
			 
			 
			 Request_DTO req_Dto =  proservice.proEdit(collabo_req_index);
			  model.addAttribute("list", req_Dto);	
		 
		  return "cen.proEdit";
		 }

	//게시판 실제 수정처리
		 @RequestMapping(value = "proEdit.htm", method = RequestMethod.POST)
		 public String proEdit(Request_DTO n,HttpServletRequest request) throws ClassNotFoundException,
		   SQLException, IOException {
			 System.out.println("/////////////////////////////");
			System.out.println(n.toString());
			proservice.proEdit(n,request);
		  return "redirect:listReplyRequest.htm";
	    	 
		 }
		 
		 
		 
	/////////////////////////////////////////////////////////////////////////
		 
		// 프로젝트를 요청해주는 클래스 이다.
			@RequestMapping("writeresponse.htm")
			public String writeResponse() {
				
				return "cen.writeResponse";

			}
		 
		 
		// 프로젝트를 요청해주는 클래스 이다.
			@RequestMapping(value = "writeresponse.htm", method = RequestMethod.POST)
			public String regResponse(With_DTO n, String collabo_req_index)
					throws IOException, ClassNotFoundException, SQLException {
					
				System.out.println("계산중 :"+ n.getCollabo_sal());
				    
				    //가지고 있는 콤마를 잘라서 집어넣었습니다 00,00 -> 0000
				    
				    System.out.println("계산오류잡는중..."+ n.getCollabo_sal().replaceAll(",", ""));
				    n.setCollabo_sal(n.getCollabo_sal().replaceAll(",", ""));
				    System.out.println("계산완료 :"+n.getCollabo_sal());
					/*System.out.println(n.toString());*/
					 proservice.regResponse(n, collabo_req_index);
					 proservice.Accept(collabo_req_index);
					// 실DB저장
				
				
				return "redirect:responseList.htm";

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
			 public String InsertManager(String collabo_req_index,String dept_no ,Model model)
			   throws ClassNotFoundException, SQLException {
			 
				 //아 힘들다..
				 
				 With_DTO req_Dto =  proservice.managerDto(collabo_req_index);
					List<Join_DTO> listmanager = proservice.listManager(dept_no); 
				 
					model.addAttribute("listmanager", listmanager); // 담당자 리스트 
				  model.addAttribute("list", req_Dto);	//협업상태 보여준다.
				  
				 /* System.out.println(req_Dto.toString());
				  System.out.println("담당자 : "+listmanager.toString());*/
				  
				  
			  return "cen.proManager";
			 }
			
			
			
			
			/*//담당자 선택역할을 한다.
			@RequestMapping( value="insertmanager.htm", method = RequestMethod.POST)
			 public String InsertManager(With_DTO m, String collabo_req_index) throws ClassNotFoundException,
			   SQLException {
				// proservice.ProManager(collabo_req_index);
				 proservice.InsertManager(m);
				 System.out.println(m.toString()+"흠냐");
				 
				  return "redirect:responseList.htm"; //리스트 화면 (controller 타서 데이터 출력)
				
			 }*/
			
			
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
