package com.fortune.request_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.accept_alarm_DAO.IAcceptAlarm;
import com.fortune.alarm_DAO.IAlarm;
import com.fortune.function_DTO.All_Alarm_DTO;
import com.fortune.function_DTO.ProgectName_DTO;
import com.fortune.function_DTO.Schedule_AlarmList_DTO;
import com.fortune.function_DTO.Search_Page_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.function_DTO.Select_name_DTO;
import com.fortune.history_Service.HistoryService;
import com.fortune.req_alarm_DAO.IReqAlarm;
import com.fortune.request_DAO.ProDao;
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
		
			System.out.println("ProController/writeForm함수");
			
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
	         
		   System.out.println("ProController/regRequest함수");
			 try {
	         //추가 사항 req_no 바꿔주기
	         
	         
	         // 실DB저장
	         proservice.regRequest(n, request);
	         
	         session.setAttribute("req_selectId",n.getCollabo_req_ID());
	         

	         
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
	public ModelAndView requestList(Search_Page_DTO search_Page_DTO, HttpSession session ,String collabo_req_date,Model model) throws ClassNotFoundException, SQLException {
		 
		
		System.out.println("ProController/requestList함수");
			
		String rs = "request";
		search_Page_DTO.setRs(rs);
		search_Page_DTO.setCollabo_req_index(collabo_req_date);
		ModelAndView mv = proservice.getRequest(sqlSession,search_Page_DTO, session);
		mv.addObject("state", "전체");

		
		return mv;
		

	}
	 // 만든 목적 : 대기 수락 거절 을 비동기 처리로 하려면 ajax 태울 곳이 필요하여 만들었습니다.
	 // 만든 날짜 : 2016 -12-02
	 @Transactional
	 @RequestMapping("requestList2.htm") // /customer/notice.htm
	 public ModelAndView requestList2(Search_Page_DTO search_Page_DTO,HttpSession session,Model model) throws ClassNotFoundException, SQLException {
		 
		 System.out.println("ProController/requestList2함수");
			
		
		 String rs = "cen";
		 search_Page_DTO.setRs(rs);

		 ModelAndView mv =proservice.getRequest(sqlSession,search_Page_DTO, session);
		 
		 mv.addObject("state", search_Page_DTO.getState());
		 return mv;
		 
		 
	 }
	// 만든 목적: 발신자가 보낸 것 수신자가 보는 리스트로 보여주는 클래스입니다,
	// 만든 날짜: 2016-11-28
	 @Transactional
	@RequestMapping("listReplyRequest.htm") // /customer/notice.htm
	public ModelAndView listReplyRequest( Search_Page_DTO search_Page_DTO, HttpSession session ,Model model) throws ClassNotFoundException, SQLException {
		
		System.out.println("ProController/listReplyRequest함수");
			
		String rs = "request";
		search_Page_DTO.setRs(rs);
		ModelAndView mv = proservice.listReplyRequest((String)session.getAttribute("req_selectId"),search_Page_DTO, session);
		 // 자동 forward
		mv.addObject("state", "전체");
	   
		
		return mv;

	}
	 //ajax 태울 곳
	 @Transactional
	 @RequestMapping("listReplyRequest2.htm") // /customer/notice.htm
	 public ModelAndView listReplyRequest2(Search_Page_DTO search_Page_DTO, HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		
		 System.out.println("ProController/listReplyRequest2함수");
		 String rs = "cen";
		 search_Page_DTO.setRs(rs);
		 ModelAndView mv = proservice.listReplyRequest((String)session.getAttribute("req_selectId"), search_Page_DTO, session);
		  // 자동 forward
		 mv.addObject("state", search_Page_DTO.getState());
		 
		 return mv;
		 
	 }
	//전체
	 @Transactional
	@RequestMapping("listallRequest.htm") // /customer/notice.htm
	public String listallRequest( Search_Page_DTO search_Page_DTO, HttpSession session ,Model model) throws ClassNotFoundException, SQLException {
		
		System.out.println("ProController/listallRequest함수");
			
		List<Request_DTO> list = proservice.listallRequest(search_Page_DTO, session);
		model.addAttribute("list", list); // 자동 forward
		
		
		return "request.requestList";

	}
	


	 	// 글상세보기
		// 추가) 알림 db지워주기
	@RequestMapping("ProDetail.htm")
		public String ProDetail(String collabo_req_index, Model model,HttpSession session) throws ClassNotFoundException, SQLException {

			System.out.println("ProController/ProDetail함수");
			
			Request_DTO proDto = proservice.ProDetail(collabo_req_index);
			model.addAttribute("list", proDto);
			
			ProDao proDao = sqlSession.getMapper(ProDao.class);
			
			//요청받은 user의 정보를 receiveuser_info에 담음
			Select_name_DTO sndto = proDao.searchName(proDto.getCollabo_req_ID());
			model.addAttribute("receiveuser_info", sndto);

			//요청한 user의 정보를 receiveuser_info에 담음
			sndto = proDao.searchName(proDto.getUser_ID());
			model.addAttribute("requestuser_info", sndto);
			
			
	        //알림 삭제하기
	        Join_DTO dto = (Join_DTO)session.getAttribute("info");
					
		
			IReqAlarm req_alarm_DAO = sqlSession.getMapper(IReqAlarm.class);
			
			int result=req_alarm_DAO.deleteReqAlarm(collabo_req_index);
			
			IAlarm alarm_DAO = sqlSession.getMapper(IAlarm.class);
			
			List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
			
			alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
			
			All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
			
			session.setAttribute("alarm", alist);
			
			session.setAttribute("totalCount",tatalCount.getTotal_count());
	        
			//추가 작업
			List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
			sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
			session.setAttribute("sch_alist", sch_alist);

			// Tiles
			return "cen.proDetail";
			// View

		}
		
		// 글상세보기
		// 추가) 알림 db지워주기
	@RequestMapping("ProDetail2.htm")
		public String ProDetail2(String collabo_req_index, String dept_no, Model model,HttpSession session) throws ClassNotFoundException, SQLException {

			System.out.println("ProController/ProDetail2함수");
			
			Request_DTO proDto = proservice.ProDetail(collabo_req_index);
			model.addAttribute("list", proDto);
			
			ProDao proDao = sqlSession.getMapper(ProDao.class);
			
			//요청한 user의 정보를 requestuser_info에 담음
			Select_name_DTO sndto = proDao.searchName(proDto.getCollabo_req_ID());
			model.addAttribute("receiveuser_info", sndto);

			//요청받은 user의 정보를 receiveuseruser_info에 담음
			sndto = proDao.searchName(proDto.getUser_ID());
			model.addAttribute("requestuser_info", sndto);
			
	        //알림 삭제하기
	        Join_DTO dto = (Join_DTO)session.getAttribute("info");
					
		
			IReqAlarm req_alarm_DAO = sqlSession.getMapper(IReqAlarm.class);
			
			int result=req_alarm_DAO.deleteReqAlarm(collabo_req_index);
			
			IAlarm alarm_DAO = sqlSession.getMapper(IAlarm.class);
			
			List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
			
			alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
			
			All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
			
			session.setAttribute("alarm", alist);
			session.setAttribute("totalCount",tatalCount.getTotal_count());
	        
			//추가 작업
			List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
			sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
			session.setAttribute("sch_alist", sch_alist);
			
			List<Join_DTO> listmanager = proservice.listManager(dept_no); 
			model.addAttribute("listmanager", listmanager); // 담당자 리스트 

			// Tiles
			return "cen.proEdit";
			// View

		}
	
	
	//작성자 : 이예지
	//작성일:2016/12/08
	//글상세보기(가격/기간 추가된 상세보기)
	@RequestMapping("MyProDetail.htm")
	public String MyProDetail(String collabo_req_index,String collabo_no,Model model,HttpSession session) throws ClassNotFoundException, SQLException {

			System.out.println("ProController/MyProDetail함수");
		
			Request_DTO proDto = proservice.ProDetail(collabo_req_index);
			model.addAttribute("list", proDto);
			ProDao prodao = sqlSession.getMapper(ProDao.class);
			With_DTO withDto = prodao.myProDetail(collabo_no);
		
			//요청받은 user의 정보를 receiveuser_info에 담음
			Select_name_DTO sndto = prodao.searchName(proDto.getCollabo_req_ID());
			model.addAttribute("receiveuser_info", sndto);

			//요청한 user의 정보를 receiveuser_info에 담음	
			sndto = prodao.searchName(proDto.getUser_ID());
			model.addAttribute("requestuser_info", sndto);
		
			
			model.addAttribute("mylist",withDto);
			// Tiles
		
			//알림 지워주기 추가)2016.12.09 예지
		
			//알림 삭제하기
				
			Join_DTO dto = (Join_DTO)session.getAttribute("info");
	
			IAcceptAlarm accept_alarm_DAO = sqlSession.getMapper(IAcceptAlarm.class);
		
			int result=accept_alarm_DAO.deleteAcceptAlarm(collabo_no);
		
			IAlarm alarm_DAO = sqlSession.getMapper(IAlarm.class);
		
			List<Select_Alarm_DTO> alist = new ArrayList<Select_Alarm_DTO>();
		
			alist = alarm_DAO.checkAlarmAll(dto.getUser_id());
		
			All_Alarm_DTO tatalCount = alarm_DAO.totalCount(dto.getUser_id());
			
			session.setAttribute("alarm", alist);
			session.setAttribute("totalCount",tatalCount.getTotal_count());
        
			//추가 작업
			List<Schedule_AlarmList_DTO> sch_alist=new ArrayList<Schedule_AlarmList_DTO>();
			sch_alist  = alarm_DAO.checkScheduleAlarm(dto.getUser_id());
			session.setAttribute("sch_alist", sch_alist);
		
		
			return "cen.myproDetail";
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
		
			System.out.println("ProController/Accept함수");
			Request_DTO proDto = proservice.DetailResponse(collabo_req_index);
			model.addAttribute("list", proDto);
			model.addAttribute("acceptlist", proDto);
		 
			List<Join_DTO> listmanager = proservice.listManager(dept_no); 
			model.addAttribute("listmanager", listmanager); // 담당자 리스트 
			return "cen.writeResponse"; //리스트 화면 (controller 타서 데이터 출력)
		 }	
		
	//거절 하기 했을 경우 화면 출력
	@RequestMapping("refuse.htm")
		 public ModelAndView Refuse(String collabo_req_text,Search_Page_DTO search_Page_DTO,HttpSession session) throws ClassNotFoundException,
		   SQLException {
			 proservice.Refuse(search_Page_DTO.getCollabo_req_index(),collabo_req_text);
		
			 String rs = "cen";
			 search_Page_DTO.setRs(rs);

			 ModelAndView mv =proservice.getRequest(sqlSession,search_Page_DTO, session);
			 
			 return mv; //리스트 화면 (controller 타서 데이터 출력)
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
			
			System.out.println("ProController/proEdit함수");
			proservice.proEdit(n,request);
			
			return "redirect:listReplyRequest.htm";
	    	 
		 }
		 
	// 프로젝트를 요청해주는 클래스 이다.
	@RequestMapping("writeresponse.htm")
		public String writeResponse() {
				
			return "cen.writeResponse";

			}
		 
		 
	// 프로젝트를 요청해주는 클래스 이다.
	// 추가) 팀장에게 알림 띄워주기
			
		
	@RequestMapping(value = "writeresponse.htm", method = RequestMethod.POST)
		public String regResponse(With_DTO n, String collabo_req_index,HttpSession session)
			throws IOException, ClassNotFoundException, SQLException {
					
			System.out.println("ProController/regResponse함수");
				    
			//가지고 있는 콤마를 잘라서 집어넣었습니다 00,00 -> 0000
				    
			n.setCollabo_sal(n.getCollabo_sal().replaceAll(",", ""));
			proservice.regResponse(n, collabo_req_index,session);
			proservice.Accept(collabo_req_index);
			// 실DB저장
			//알림 DB에 insert 해주기(트리거에서 저장)					 
		    session.setAttribute("accept_selectId",n.getUser_ID());
				
			return "redirect:responseList.htm";

			}
		 
		
// 프로젝트의 협업상태를 보여주는 클래스이다.
			

	@RequestMapping("responseList_ver1.htm") // /customer/notice.htm
		public ModelAndView listResponse_ver1(String pg, String f, String q,HttpSession session ,Model model) throws ClassNotFoundException, SQLException {
				
				//성준이 협업 리스트 코드
			ModelAndView mv = new ModelAndView();
			mv = proservice.listResponse( pg, f, q, session);
				
			mv.setViewName("request.collaboList");
				
			return mv;
				
				
			}
			
		
	@RequestMapping("responseList.htm") // /customer/notice.htm
		public ModelAndView listResponse(Search_Page_DTO search_Page_DTO,HttpSession session ,Model model) throws ClassNotFoundException, SQLException {
				
			String st=null;
			search_Page_DTO.setSt(st);
			String me=null;
			search_Page_DTO.setMe(me);
			String se=null;
			search_Page_DTO.setSe(se);
			String collabo_req_date=null;
			search_Page_DTO.setCollabo_req_index(collabo_req_date);
				
			String rs = "request";
			search_Page_DTO.setRs(rs);
			ModelAndView mv = proservice.getRequest(sqlSession,search_Page_DTO, session);
				

				
				//성준이 협업 리스트 코드
				//List<With_DTO> list = proservice.listResponse( pg, f, q, session);
			
				
				//model.addAttribute("list", list); // 리스트 협업상태
				
				
				
				System.out.println("--------accept_selectId--------controller");
				model.addAttribute("accept_selectId",session.getAttribute("accept_selectId"));
				/*System.out.println("리스트 협업상태 : "+list);*/

				
				return mv;

			}	
	@RequestMapping("responseList2.htm") // /customer/notice.htm
			public ModelAndView listResponse2( String pg, String f, String q,HttpSession session ) throws ClassNotFoundException, SQLException {
				ModelAndView mv = new ModelAndView();
				mv = proservice.listResponse( pg, f, q, session);
				
				mv.setViewName("cen.collaboList");
				
				
				
				return mv;
				
			}	
			
//담당자 선택역할을 하는 클래스입니다.
		@RequestMapping(value = "insertmanager.htm", method= RequestMethod.GET)
			 public String InsertManager(String collabo_req_index,String dept_no ,Model model)
			   throws ClassNotFoundException, SQLException {
			 
			
				 
				With_DTO req_Dto =  proservice.managerDto(collabo_req_index);
				List<Join_DTO> listmanager = proservice.listManager(dept_no); 
				 
				model.addAttribute("listmanager", listmanager); // 담당자 리스트 
				model.addAttribute("list", req_Dto);	//협업상태 보여준다.
		
				return "cen.proManager";
			 }
			

			
//사용 목적: 다운로드 하는 부분인데 요청 상태에서 제안서나 그런것을 받을 때 사용 되는 클래스이다.	
// 날짜 일자 :2016-11-25
		@RequestMapping("download.htm")
			 public void download(String p, String f, HttpServletRequest request,
			   HttpServletResponse response) throws IOException {
				 	
				proservice.download(p, f, request, response);
				 
			 }

}
