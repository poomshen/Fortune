package com.fortune.request_Service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Accept_Alarm_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Notice_DTO;
import com.fortune.Table_DTO.Req_Alarm_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.accept_alarm_DAO.IAcceptAlarm;
import com.fortune.function_DTO.Search_Page_DTO;
import com.fortune.function_DTO.Select_Alarm_DTO;
import com.fortune.function_DTO.Select_name_DTO;
import com.fortune.notice_DAO.INotice;
import com.fortune.req_alarm_DAO.IReqAlarm;
import com.fortune.request_DAO.ProDao;
import com.fortune.request_DTO.Passion_DTO;

@Service
public class ProService {

   @Autowired
   private SqlSession sqlsession;
   
   //협업 답장자함 입니다.
   public ModelAndView getRequest(SqlSession sqlsession,Search_Page_DTO search_Page_DTO,HttpSession session)

         throws ClassNotFoundException, SQLException {
	   
      // 게시판 기본 설정(기본값 처리)/////////////
      int page = 1;
      String field = "collabo_req_ID";
      Join_DTO ids = (Join_DTO) session.getAttribute("info");
      
      // 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
      
      
      String query = "%" + ids.getUser_id() + "%";
      String st_query ="%%";
      
      String memo = "collabo_req_title";
      String search = "%%";
      //////////////////////////////////////
      
      if (search_Page_DTO.getPg() == 0) {
          search_Page_DTO.setPg(page);
      }
      if (search_Page_DTO.getF() == null || search_Page_DTO.getF() .equals("")) {
         search_Page_DTO.setF(field); 
      }
      if (search_Page_DTO.getQ()  == null || search_Page_DTO.getQ().equals("")) {
         search_Page_DTO.setQ(query);
      }
      if (search_Page_DTO.getSt()  == null) {
        search_Page_DTO.setSt(st_query);
      }else{
          search_Page_DTO.setSt(search_Page_DTO.getSt());
      }
      if (search_Page_DTO.getSe() == null) {
          search_Page_DTO.setSe(search);
      }else{
          search_Page_DTO.setSe(search_Page_DTO.getSe());
      }
      if (search_Page_DTO.getMe() == null) {
         search_Page_DTO.setMe(memo);
      }
      ModelAndView mv = new ModelAndView();
      ProDao proDao = sqlsession.getMapper(ProDao.class);

      int row_size = 6;
      int total_count = proDao.requestCount(search_Page_DTO); // 공지사항 글 개수
      // 공지사항 글 목록
      int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
      // int totalPage = total/rowSize + (total%rowSize==0?0:1);
      int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
      // [10] >>
      int from_page = ((search_Page_DTO.getPg() - 1) / block * block) + 1; // 보여줄 페이지의 시작
      // ((1-1)/10*10)
      int to_page = ((search_Page_DTO.getPg() - 1) / block * block) + block; // 보여줄 페이지의 끝
      if (to_page > all_page) { // 예) 20>17
         to_page = all_page;
      }
      // Mybatis 적용

      List<Request_DTO> list = proDao.getRequest(search_Page_DTO);
  
      mv.addObject("total_count", total_count);
      mv.addObject("pg", search_Page_DTO.getPg());
      mv.addObject("all_page", all_page);
      mv.addObject("block", block);
      mv.addObject("from_page", from_page);
      mv.addObject("to_page", to_page);
      mv.addObject("st_query", st_query);
      mv.addObject("memo", search_Page_DTO.getMe());
      mv.addObject("search", search_Page_DTO.getSe());
      mv.setViewName(search_Page_DTO.getRs()+".tikeRequestList");
      
      
      //추가사항 : 알림 new할것 가져오기
      List<Req_Alarm_DTO> alist = new ArrayList<Req_Alarm_DTO>();
      IReqAlarm req_alarmDAO = sqlsession.getMapper(IReqAlarm.class);
      alist =req_alarmDAO.selectReqAlarm();
      
      for(int list_i=0;list_i<list.size();list_i++){
         for(int alist_i=0;alist_i<alist.size();alist_i++){
            String new_req_alarm ="";
            
            new_req_alarm=list.get(list_i).getCollabo_req_index();
            if(Integer.parseInt(new_req_alarm)==alist.get(alist_i).getCollabo_req_index())
            {
               String real_new_req_alarm="";
               real_new_req_alarm=list.get(list_i).getCollabo_req_index()+"n";
               list.get(list_i).setCollabo_req_index(real_new_req_alarm);
               alist_i=alist.size();
            }
               
         }
         
      }
      mv.addObject("list", list);  
           
      return mv;
   }
   
   //협업 작성자 리스트 입니다.
   public ModelAndView listReplyRequest(String selectId,Search_Page_DTO search_Page_DTO, HttpSession session)
            throws ClassNotFoundException, SQLException {
         // 게시판 기본 설정(기본값 처리)/////////////
        int page = 1;
        String field = "user_ID";
        Join_DTO ids = (Join_DTO) session.getAttribute("info");
        // 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
        String query = "%" + ids.getUser_id() + "%";
        String st_query = "%%"; //대기 , 수락 , 거절 결정
        String memo = "collabo_req_title";
        String search = "%%";
         
         //////////////////////////////////////
        if (search_Page_DTO.getPg() == 0) {
             search_Page_DTO.setPg(page);
        }
        if (search_Page_DTO.getF() == null || search_Page_DTO.getF() .equals("")) {
            search_Page_DTO.setF(field); 
        }
        if (search_Page_DTO.getQ()  == null || search_Page_DTO.getQ().equals("")) {
            search_Page_DTO.setQ(query);
        }
        if (search_Page_DTO.getSt()  == null) {
           search_Page_DTO.setSt(st_query);
        }else{
            search_Page_DTO.setSt(search_Page_DTO.getSt());
        }
        if (search_Page_DTO.getSe() == null) {
            search_Page_DTO.setSe(search);
        }else{
            search_Page_DTO.setSe(search_Page_DTO.getSe());
        }
        if (search_Page_DTO.getMe() == null) {
            search_Page_DTO.setMe(memo);
        }
         
        ModelAndView mv = new ModelAndView();
        ProDao proDao = sqlsession.getMapper(ProDao.class);
        int row_size = 6;
        int total_count = proDao.requestCount(search_Page_DTO); // 공지사항 글 개수
        // 공지사항 글 목록
        int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
        // int totalPage = total/rowSize + (total%rowSize==0?0:1);
        int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
        // [10] >>
        int from_page = ((search_Page_DTO.getPg() - 1) / block * block) + 1; // 보여줄 페이지의 시작
        // ((1-1)/10*10)
        int to_page = ((search_Page_DTO.getPg() - 1) / block * block) + block; // 보여줄 페이지의 끝
        if (to_page > all_page) { // 예) 20>17
            to_page = all_page;
        }
         // Mybatis 적용
         
        List<Request_DTO> list = proDao.getRequest(search_Page_DTO);

         
        mv.addObject("list", list);
        mv.addObject("total_count", total_count);
        mv.addObject("pg", search_Page_DTO.getPg());
        mv.addObject("all_page", all_page);
        mv.addObject("block", block);
        mv.addObject("from_page", from_page);
        mv.addObject("to_page", to_page);
        mv.addObject("st_query", st_query);
        mv.addObject("memo", search_Page_DTO.getMe());
        mv.addObject("search", search_Page_DTO.getSe());
        mv.setViewName(search_Page_DTO.getRs()+".postRequestList");
        mv.addObject("selectId",selectId);
          
        return mv;
      }

      //협업 전체 리스트 입니다.
    public List<Request_DTO> listallRequest(Search_Page_DTO search_Page_DTO, HttpSession session)
                  throws ClassNotFoundException, SQLException {

        // 게시판 기본 설정(기본값 처리)/////////////
        int page = 1;
        String field = "user_ID";
        Join_DTO ids = (Join_DTO) session.getAttribute("info");
        // 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
        String query = "%" + "" + "%";
        String st_query ="%%";
        String memo = "collabo_req_title";
        String search = "%%";
        /////////////////////////////////////
        if (search_Page_DTO.getPg() == 0) {
           search_Page_DTO.setPg(page);;
               }
        if (search_Page_DTO.getF() == null || search_Page_DTO.getF() .equals("")) {
                  search_Page_DTO.setF(field); 
               }
        if (search_Page_DTO.getQ()  == null || search_Page_DTO.getQ().equals("")) {
                  search_Page_DTO.setQ(query);
               }
        if (search_Page_DTO.getSt()  == null) {
                 search_Page_DTO.setSt(st_query);
               }
        if (search_Page_DTO.getSe() == null) {
                  search_Page_DTO.setSe(search);
               }
        if (search_Page_DTO.getMe() == null) {
                  search_Page_DTO.setMe(memo);
               }

        // Mybatis 적용
        ProDao proDao = sqlsession.getMapper(ProDao.class);
               
        List<Request_DTO> list = proDao.getRequest(search_Page_DTO);
                  
               return list;
         	   }
   
   
   
        //대기 , 수락 , 거절 클래스 입니다.
     public Request_DTO kindState(String collabo_req_state) throws ClassNotFoundException, SQLException {

         ProDao proDao = sqlsession.getMapper(ProDao.class);
         Request_DTO proDto = proDao.kindState(collabo_req_state);

        // Tiles
         return proDto;
        // View

            }
            
            
            
   
   // 협업요청 상세보기

     public Request_DTO ProDetail(String collabo_req_index) throws ClassNotFoundException, SQLException {

    	 ProDao proDao = sqlsession.getMapper(ProDao.class);
    	 Request_DTO proDto = proDao.getProDto(collabo_req_index);

    	 // Tiles
    	 return proDto;
    	 // View

   }

   // 글요청
     public Request_DTO regRequest(Request_DTO n, HttpServletRequest request)
         throws IOException, ClassNotFoundException, SQLException {

    	List<CommonsMultipartFile> files = n.getFiles();
        List<String> filenames = new ArrayList<String>(); //파일명만 추출
        
        if(files != null && files.size() > 0 ){ //업로드한 파일이 하나라도 있다면
           
        for(CommonsMultipartFile multipartfile : files ){
                                          
             String fname = multipartfile.getOriginalFilename(); //파일명 얻기
             String path  = request.getServletContext().getRealPath("/customer/upload");
             String fullpath = path + "\\" + fname;
              
              
        if(!fname.equals("")){
                //서버에 파일 쓰기 작업 
             FileOutputStream fs = new FileOutputStream(fullpath);
             fs.write(multipartfile.getBytes());
             fs.close();
              }
             filenames.add(fname); //실 DB Insert 작업시 .. 파일명 
           }
           
        }
        
       
        n.setCollabo_req_filesrc(filenames.get(0));  // 파일명으로 데이터에 넣을 것들입니다.
        
      // 실DB저장

        ProDao proDao = sqlsession.getMapper(ProDao.class);
      
        proDao.insert(n);

        return n;

   }

     // 글 삭제
     public String ProDel(String collabo_req_index) throws ClassNotFoundException, SQLException {
      
    	ProDao proDao = sqlsession.getMapper(ProDao.class);
    	proDao.delete(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
    	return collabo_req_index;
    }

     // 글 수락
     public Request_DTO DetailResponse(String collabo_req_index) throws ClassNotFoundException, SQLException {
    	 ProDao proDao = sqlsession.getMapper(ProDao.class);
      
    	 Request_DTO proDto = proDao.detailResponse(collabo_req_index); 
      
    	 return proDto;
   }
   
     // 사용 목적: 협업 요청에 수락을 하게 되면 대기 에서 수락으로 변경 시키는 클래스입니다.
     // 시간 날짜: 2011-11-26
     public int Accept(String collabo_req_index) throws ClassNotFoundException, SQLException {
         ProDao proDao = sqlsession.getMapper(ProDao.class);
         
         int re= proDao.accept(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
         
         return re;
      }

     // 글 거절
     public int Refuse(String collabo_req_index,String collabo_req_text) throws ClassNotFoundException, SQLException {
    	 String collabo_req_textAll;
      
    	 ProDao proDao = sqlsession.getMapper(ProDao.class);
    	 collabo_req_textAll = proDao.selectReqText(Integer.parseInt(collabo_req_index));
    	 collabo_req_textAll += "<br>거절 사유 : <br>"+collabo_req_text;
    	 int re = proDao.refuse(collabo_req_index,collabo_req_textAll); // 여기에서 Update 사용하여  바꿔줌
    	 return re;
   }

     // 글요청 처리
     public Request_DTO regResponse(With_DTO n, String collabo_req_index, HttpSession session)
         throws IOException, ClassNotFoundException, SQLException {

     // 실DB저장
    	 Join_DTO ids = (Join_DTO) session.getAttribute("info");
    	 n.setCollabo_state("진행중");
    	 n.setCollabo_req_ID(ids.getUser_id());
    	 ProDao proDao = sqlsession.getMapper(ProDao.class);
    	 proDao.insertResponse(n);
    	 Request_DTO proDto = proDao.detailResponse(collabo_req_index);

    	 return proDto;

   }

     // 글수정 화면
     @RequestMapping(value = "proEdit.htm", method = RequestMethod.GET)
     public Request_DTO proEdit(String collabo_req_index) throws ClassNotFoundException, SQLException {

    	 ProDao proDao = sqlsession.getMapper(ProDao.class);
    	 Request_DTO req_Dto = proDao.getProDto(collabo_req_index);

    	 return req_Dto;
   }

     // 실제 글수정
     public Request_DTO proEdit( Request_DTO n, HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException {

      
    	 List<CommonsMultipartFile> files = n.getFiles();
    	 List<String> filenames = new ArrayList<String>(); //파일명만 추출
        
    	 if(files != null && files.size() > 0 ){ //업로드한 파일이 하나라도 있다면
           
           for(CommonsMultipartFile multipartfile : files ){
                                          
              String fname = multipartfile.getOriginalFilename(); //파일명 얻기
              String path  = request.getServletContext().getRealPath("/customer/upload");
              String fullpath = path + "\\" + fname;
              
         if(!fname.equals("")){
                //서버에 파일 쓰기 작업 
              FileOutputStream fs = new FileOutputStream(fullpath);
              fs.write(multipartfile.getBytes());
              fs.close();
            }
              filenames.add(fname); //실 DB Insert 작업시 .. 파일명 
           }
           
        }
     
      // DB저장작업
      // DB 저장할 파일 명
        n.setCollabo_req_filesrc(filenames.get(0));  // 파일명 1 
        
        
        ProDao proDao = sqlsession.getMapper(ProDao.class);
        if(n.getCollabo_req_filesrc().isEmpty()){
    	  proDao.updatenull(n);
        }else{
    	  proDao.update(n);
        }
      
        return n;

   }


   // 전체 협업 리스트 입니다. 
   // 즉 협업요청이 아닌 협업이 완료된 상태를 의미합니다.
   // 추가사항: 이예지 MYPROJECT에 알림 띄워주기 
   //	->작업일 : 2016/12/09
   public ModelAndView listResponse(String pg, String f, String q, HttpSession session)
         throws ClassNotFoundException, SQLException {

      // 게시판 기본 설정(기본값 처리)/////////////
      int page = 1;
      String query="";
      String field = "";
      // 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
      Join_DTO ids = (Join_DTO) session.getAttribute("info");
      ProDao proDao = sqlsession.getMapper(ProDao.class);
      
      ModelAndView mv = new ModelAndView();
      //페이지 처리를 위한 코드
     
      //추가 2016-12-01 부장 ,팀장 ,사원 리스트 보여주기
      if(ids.getRole_no() == 2){
          query = "%" + ids.getUser_id() + "%";
          field = "collabo_req_ID";
      }else if(ids.getRole_no() == 3){
          field = "user_ID";
          query = "%" + ids.getUser_id() + "%";
          
      }else if(ids.getRole_no() == 4){
         field = "user_ID";
         List<String>  timeId = proDao.selectTeamMGR(ids.getTeam_no()) ;
      if(timeId.size() != 0 ){
            
      int row_size = 6; 
      int total_count = proDao.collaboCount(field, timeId) ; // 공지사항 글 개수
      // 공지사항 글 목록         
      int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
      // int totalPage = total/rowSize + (total%rowSize==0?0:1);
      int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
      // [10] >>
      int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
      // ((1-1)/10*10)
      int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
      if (to_page > all_page) { // 예) 20>17
               to_page = all_page;
            }
      if (pg != null ) {
               page = Integer.parseInt(pg);
            }
      mv.addObject("total_count", total_count);
      mv.addObject("pg", page);
      mv.addObject("all_page", all_page);
      mv.addObject("block", block);
      mv.addObject("from_page", from_page);
      mv.addObject("to_page", to_page);
      List<With_DTO> list = proDao.listResponse2(page, field, timeId);
      mv.addObject("list",list);
      List<Select_name_DTO> teamName =new ArrayList<Select_name_DTO>();
      for(int i = 0; i<list.size() ; i++){
           teamName.add(proDao.searchName(list.get(i).getUser_ID()));//팀장 아이디 부서, 팀
       } 
      mv.addObject("teamName", teamName);
            
      return mv;
         
      }
      mv.addObject("collabo_null", 777);
      return mv;
      }else if(ids.getRole_no() == 1||ids.getRole_no() == 0){
      query = "%%";
      field = "collabo_req_ID";
      }else {
      query = "NO";
      field = "collabo_req_ID";
      }
      
      if (pg != null ) {
         page = Integer.parseInt(pg);
      }
      if (f != null && f.equals("")) {
         field = f;
      }
      if (q != null && q.equals("")) {
         query = q;
      }
      List<String> timeId = new ArrayList<String>();
      timeId.add(ids.getUser_id());
      int row_size = 6;
      int total_count = proDao.collaboCount(field, timeId) ; // 글 개수
      // 공지사항 글 목록
      int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
      // int totalPage = total/rowSize + (total%rowSize==0?0:1);
      int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
      // [10] >>
      int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
      // ((1-1)/10*10)
      int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
      if (to_page > all_page) { // 예) 20>17
         to_page = all_page;
      }
      mv.addObject("total_count", total_count);
      mv.addObject("pg", page);
      mv.addObject("all_page", all_page);
      mv.addObject("block", block);
      mv.addObject("from_page", from_page);
      mv.addObject("to_page", to_page);
      
      // Mybatis 적용
      List<With_DTO> list = proDao.listResponse(page, field, query);
      
      
      //알림할것 가져오기
      //추가사항 : 알림 new할것 가져오기
      if(ids.getRole_no() == 3){
      List<Accept_Alarm_DTO> ac_list = new ArrayList<Accept_Alarm_DTO>();
      IAcceptAlarm accept_alarmDAO = sqlsession.getMapper(IAcceptAlarm.class);
      ac_list =accept_alarmDAO.selectAcceptAlarm(ids.getUser_id());
      
      for(int list_i=0;list_i<list.size();list_i++){
         for(int ac_list_i=0;ac_list_i<ac_list.size();ac_list_i++){
            String new_accept_alarm ="";
            
            new_accept_alarm=list.get(list_i).getCollabo_no();
            if(Integer.parseInt(new_accept_alarm)==ac_list.get(ac_list_i).getCollabo_no())
            {
               String real_new_accept_alarm="";
               real_new_accept_alarm=list.get(list_i).getCollabo_no()+"n";
               list.get(list_i).setCollabo_no(real_new_accept_alarm);
               ac_list_i=ac_list.size();
            }
               
         }
         
      }
      
      mv.addObject("list",list);
      List<Select_name_DTO> teamName =new ArrayList<Select_name_DTO>();
      
      for(int i = 0; i<list.size() ; i++){
         teamName.add(proDao.searchName(list.get(i).getUser_ID()));//팀장 아이디 부서, 팀
      } 
      mv.addObject("teamName", teamName);
      return mv;
           
      }
      mv.addObject("list",list);
      List<Select_name_DTO> teamName =new ArrayList<Select_name_DTO>();
      for(int i = 0; i<list.size() ; i++){
         teamName.add(proDao.searchName(list.get(i).getUser_ID()));//팀장 아이디 부서, 팀
     
      } 
      mv.addObject("teamName", teamName);
      return mv;
   }
   
   // 담당자 화면
   public With_DTO managerDto(String collabo_req_index) 
         throws ClassNotFoundException, SQLException {

      ProDao proDao = sqlsession.getMapper(ProDao.class);
      With_DTO req_Dto = proDao.managerDto(collabo_req_index);
      return req_Dto;
   }

   
   //수신자 리스트  클래스입니다.
   public List<Passion_DTO> listEffect(Model model) 
         throws ClassNotFoundException, SQLException{
      
      ProDao checking_DAO = sqlsession.getMapper(ProDao.class);
      List<Passion_DTO> list = checking_DAO.listEffect();
      
      
      return list;
   }
   
   
   //담당자 리스트  클래스입니다.
   public List<Join_DTO> listManager(String dept_no) 
         throws ClassNotFoundException, SQLException{
         
      ProDao checking_DAO = sqlsession.getMapper(ProDao.class);
         
      List<Join_DTO> list = checking_DAO.listManager(dept_no);
         
      return list;
      }

      
   //사용 목적: 다운로드 를 하였을 때 사용되는 클래스이다.
   //날짜 일자: 2016-11-26
   public void download(String p, String f, HttpServletRequest request,
               HttpServletResponse response) throws IOException {
          
      String fname = new String(f.getBytes("euc-kr"), "8859_1");
   // 다운로드 기본 설정 (브라우져가 read 하지 않고 ... 다운 )
   // 요청 - 응답 간에 헤더정보에 설정을 강제 다운로드
   // response.setHeader("Content-Disposition", "attachment;filename=" +
   // new String(fname.getBytes(),"ISO8859_1"));
      response.setHeader("Content-Disposition", "attachment;filename="+ fname + ";");
   // 파일명 전송
   // 파일 내용전송
      String fullpath = request.getServletContext().getRealPath("/customer/" + p + "/" + f);
      FileInputStream fin = new FileInputStream(fullpath);
   // 출력 도구 얻기 :response.getOutputStream()
      ServletOutputStream sout = response.getOutputStream();
      byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
      int size = 0;
      while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
                        // 담고
           { 
    	  // 마지막 남아있는 byte 담고 그다음 없으면 탈출
            sout.write(buf, 0, size); // 1kbyte씩 출력
           }
      fin.close();
      sout.close();
          
       }

}