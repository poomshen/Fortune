package com.fortune.request_Service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.View;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;

import com.fortune.request_DAO.ProDao;

@Service
public class ProService {

	@Autowired
	private SqlSession sqlsession;

	//협업 답장자 리스트 입니다.
	public List<Request_DTO> getRequest(String pg, String f, String q,String st, HttpSession session)
			throws ClassNotFoundException, SQLException {
		System.out.println("집에 갑시다.");

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "collabo_req_ID";
		Join_DTO ids = (Join_DTO) session.getAttribute("info");
		
		// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
		
		String query = "%" + ids.getUser_id() + "%";
		String st_query ="%%";
		//////////////////////////////////////
		if (pg != null && pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && f.equals("")) {
			field = f;
		}
		if (q != null && q.equals("")) {
			query = q;
		}
		if (st != null) {
			st_query = st;
		}

		System.out.println(page + " / " + field + " / " + query + "/"+ st_query);

		// Mybatis 적용
		ProDao proDao = sqlsession.getMapper(ProDao.class);

		List<Request_DTO> list = proDao.getRequest(page, field, query,st_query);

		return list;
	}
	
	//협업 작성자 리스트 입니다.
		public List<Request_DTO> listReplyRequest(String pg, String f, String q,String st, HttpSession session)
				throws ClassNotFoundException, SQLException {
			System.out.println("집에 갑시다.");

			// 게시판 기본 설정(기본값 처리)/////////////
			int page = 1;
			String field = "user_ID";
			Join_DTO ids = (Join_DTO) session.getAttribute("info");
			// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
			String query = "%" + ids.getUser_id() + "%";
			String st_query = "%%"; //대기 , 수락 , 거절 결정
			//////////////////////////////////////
			if (pg != null && pg.equals("")) {
				page = Integer.parseInt(pg);
			}
			if (f != null && f.equals("")) {
				field = f;
			}
			if (q != null && q.equals("")) {
				query = q;
			}
			if (st != null) {
				st_query = st;
			}

			System.out.println(page + " / " + field + " / " + query+" / "+st_query);

			// Mybatis 적용
			ProDao proDao = sqlsession.getMapper(ProDao.class);

			List<Request_DTO> list = proDao.getRequest(page, field, query, st_query);

			return list;
		}

		//협업 전체 리스트 입니다.
				public List<Request_DTO> listallRequest(String pg, String f, String q,String st, HttpSession session)
						throws ClassNotFoundException, SQLException {
					System.out.println("집에 갑시다.");

					// 게시판 기본 설정(기본값 처리)/////////////
					int page = 1;
					String field = "user_ID";
					Join_DTO ids = (Join_DTO) session.getAttribute("info");
					// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
					String query = "%" + "" + "%";
					String st_query ="%%";
					//////////////////////////////////////
					if (pg != null && pg.equals("")) {
						page = Integer.parseInt(pg);
					}
					if (f != null && f.equals("")) {
						field = f;
					}
					if (q != null && q.equals("")) {
						query = q;
					}
					if (st != null) {
						st_query = st;
					}
					System.out.println("***"+st);
					System.out.println(page + " / " + field + " / " + query+"/"+st_query);

					// Mybatis 적용
					ProDao proDao = sqlsession.getMapper(ProDao.class);

					List<Request_DTO> list = proDao.getRequest(page, field, query,st_query);

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

		System.out.println("실제 글 등록 처리");
		System.out.println("n : " + n.getCollabo_req_ID());
		System.out.println("n : " + n.getCollabo_req_index());
		System.out.println("n : " + n.getCollabo_req_no());
		System.out.println("n : " + n.getCollabo_req_state());
		System.out.println("file :"+n.getCollabo_req_filesrc());
		
		List<CommonsMultipartFile> files = n.getFiles();
		  List<String> filenames = new ArrayList<String>(); //파일명만 추출
		  
		  if(files != null && files.size() > 0 ){ //업로드한 파일이 하나라도 있다면
			  
			  for(CommonsMultipartFile multipartfile : files ){
				                              
				  String fname = multipartfile.getOriginalFilename(); //파일명 얻기
				  String path  = request.getServletContext().getRealPath("/customer/upload");
				  String fullpath = path + "\\" + fname;
				  
				  System.out.println(fname + " / " + path + " / " + fullpath);
				  
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
		System.out.println("collabo_req_index : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.delete(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
		return collabo_req_index;
	}

	// 글 수락
	public Request_DTO DetailResponse(String collabo_req_index) throws ClassNotFoundException, SQLException {
		System.out.println("seq : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		
		Request_DTO proDto = proDao.detailResponse(collabo_req_index); 
		
		System.out.println("index : " + proDto.getCollabo_req_index());
		System.out.println("no : " + proDto.getCollabo_req_no());

		return proDto;
	}
	
	// 사용 목적: 협업 요청에 수락을 하게 되면 대기 에서 수락으로 변경 시키는 클래스입니다.
	// 시간 날짜: 2011-11-26
		public int Accept(String collabo_req_index) throws ClassNotFoundException, SQLException {
			System.out.println("seq : " + collabo_req_index);
			ProDao proDao = sqlsession.getMapper(ProDao.class);
			int re= proDao.accept(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
			return re;
		}

	// 글 거절
	public int Refuse(String collabo_req_index) throws ClassNotFoundException, SQLException {
		System.out.println("seq : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		int re = proDao.refuse(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
		return re;
	}

	// 글요청
	public Request_DTO regResponse(With_DTO n, String collabo_req_index)
			throws IOException, ClassNotFoundException, SQLException {

		System.out.println("실제 글 등록 처리");

		System.out.println("n : " + n.getCollabo_req_no());
		System.out.println("n : " + n.getUser_ID());
		System.out.println("n : " + n.getCollabo_req_index());
		System.out.println(n.toString());
		/*
		 * System.out.println(n.getCollabo_end2());
		 * System.out.println(n.getCollabo_start2());
		 */
		// 아주좋소
		/* n.setCollabo_end(java.sql.Timestamp.valueOf(n.getCollabo_end2())); */
		// 실DB저장

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
	@RequestMapping(value = "noticeEdit.htm", method = RequestMethod.POST)
	public Request_DTO proEdit(Request_DTO n) throws ClassNotFoundException, SQLException, IOException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.update(n);
		return n;

	}

	//////////////////////////////////////////////////////////////

	// 전체 협업 리스트 입니다. 
	// 즉 협업요청이 아닌 협업이 완료된 상태를 의미합니다.
	
	public List<With_DTO> listResponse(String pg, String f, String q, HttpSession session)
			throws ClassNotFoundException, SQLException {
		System.out.println("집에 갑시다.");

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "collabo_req_ID";
		Join_DTO ids = (Join_DTO) session.getAttribute("info");
		// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
		String query = "%" + ids.getUser_id() + "%";
		//////////////////////////////////////
		if (pg != null && pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && f.equals("")) {
			field = f;
		}
		if (q != null && q.equals("")) {
			query = q;
		}

		System.out.println(page + " / " + field + " / " + query);

		// Mybatis 적용
		ProDao proDao = sqlsession.getMapper(ProDao.class);

		List<With_DTO> list = proDao.listResponse(page, field, query);

		return list;
	}

	// 담당자 화면
	public With_DTO managerDto(String collabo_req_index) 
			throws ClassNotFoundException, SQLException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		
		With_DTO req_Dto = proDao.managerDto(collabo_req_index);

		return req_Dto;
	}

	// 담당자를 선택하는 역할을 한다.
	public With_DTO InsertManager(With_DTO m) throws ClassNotFoundException, SQLException {
		System.out.println("tostring : " + m.toString());
		
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		 proDao.updatemanager(m);
		return m;
	}
	
	//수신자 리스트  클래스입니다.
	public List<Join_DTO> listEffect(Model model) 
			throws ClassNotFoundException, SQLException{
		
		ProDao checking_DAO = sqlsession.getMapper(ProDao.class);
		List<Join_DTO> list = checking_DAO.listEffect();
		
		System.out.println(list);
		
		return list;
	}
	
	//담당자 리스트  클래스입니다.
	public List<Join_DTO> listManager(Model model) 
			throws ClassNotFoundException, SQLException{
			
			ProDao checking_DAO = sqlsession.getMapper(ProDao.class);
			
			List<Join_DTO> list = checking_DAO.listManager();
			System.out.println("私たちは今も悪い道を行っているのか..?");
			//System.out.println(list);
			
			return list;
		}
		// 대기에서 진행중으로 변환 시키는 클래스입니다.
		// 날짜 일자 :2016-11-25
		public int ProManager(String collabo_req_index) throws ClassNotFoundException, SQLException {
			System.out.println("collabo_req_index : " + collabo_req_index);
			ProDao proDao = sqlsession.getMapper(ProDao.class);
			 // 진행중으로 변환시키는 데이터 
			int re= proDao.manager(collabo_req_index); 
			return re;
		}
		
		
		 //사용 목적: 다운로드 를 하였을 때 사용되는 클래스이다.
		 //날짜 일자: 2016-11-26
		 public void download(String p, String f, HttpServletRequest request,
				   HttpServletResponse response) throws IOException {
			 
			 String fname = new String(f.getBytes("euc-kr"), "8859_1");
			  System.out.println(fname);
			  // 다운로드 기본 설정 (브라우져가 read 하지 않고 ... 다운 )
			  // 요청 - 응답 간에 헤더정보에 설정을 강제 다운로드
			  // response.setHeader("Content-Disposition", "attachment;filename=" +
			  // new String(fname.getBytes(),"ISO8859_1"));
			  response.setHeader("Content-Disposition", "attachment;filename="
			    + fname + ";");
			  // 파일명 전송
			  // 파일 내용전송
			  String fullpath = request.getServletContext().getRealPath(
			    "/customer/" + p + "/" + f);
			  System.out.println(fullpath);
			  FileInputStream fin = new FileInputStream(fullpath);
			  // 출력 도구 얻기 :response.getOutputStream()
			  ServletOutputStream sout = response.getOutputStream();
			  byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
			  int size = 0;
			  while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
			               // 담고
			  { // 마지막 남아있는 byte 담고 그다음 없으면 탈출
			   sout.write(buf, 0, size); // 1kbyte씩 출력
			  }
			  fin.close();
			  sout.close();
			 
		 }
	

}
