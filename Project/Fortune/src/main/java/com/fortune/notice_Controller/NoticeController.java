/*
* @Class : NoticeController
* @Date : 2016.11.16
* @Author : 김지율
* @Desc : 공지사항게시판 Controller
*/

package com.fortune.notice_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fortune.notice_DAO.INotice;
import com.fortune.notice_DTO.Notice_DTO;

import dao.NoticeDao;
import vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private SqlSession sqlSession;

	// 공지사항 글목록보기
	@RequestMapping("/noticeList.htm")
	public String noticeList(String pg, String f, String q, Model model) throws ClassNotFoundException, SQLException {

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "NOTICE_TITLE";
		String query = "%%";
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

		System.out.println("NoticeController의 noticeList를 탑니다~");

		INotice noticeDao = sqlSession.getMapper(INotice.class);
		List<Notice_DTO> noticeList = noticeDao.listNotice(page, field, query);
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}

	// 글등록 화면 처리
	@RequestMapping(value="noticeWrite.htm", method=RequestMethod.GET)
	public String noticeInsert() {
		System.out.println("글쓰기 매핑");
		return "notice/noticeWrite";
	}

	// 글등록 처리(실제 글등록 처리)
	@RequestMapping(value="noticeWrite.htm", method=RequestMethod.POST)
	public String noticeInsert(Notice_DTO ndto)
			throws IOException, ClassNotFoundException, SQLException {

		System.out.println("실제 글 등록 처리");
		System.out.println(ndto.getNotice_title());
		System.out.println(ndto.getNotice_text());
//		System.out.println("n : " + ndto.getNotice_title());
//		System.out.println("n : " + ndto.getNotice_text());
		
		/*System.out.println("n : " + ndto.getFiles().get(0).getName()); // 첨부
																	// 파일(CommonsMultipartFile
																	// > file)
		System.out.println("n : " + n.getFiles().get(1).getName());
*/
		// 추후 다중 파일 업로드
		// <input type="file" name="files[0]"
		// <input type="file" name="files[1]"
		// files[0] > 1.jpg
		// files[1] > 2.jpg
/*
		List<CommonsMultipartFile> files = n.getFiles();
		List<String> filenames = new ArrayList<String>(); // 파일명만 추출

		if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면

			for (CommonsMultipartFile multipartfile : files) {

				String fname = multipartfile.getOriginalFilename(); // 파일명 얻기
				String path = request.getServletContext().getRealPath("/customer/upload");
				String fullpath = path + "\\" + fname;

				System.out.println(fname + " / " + path + " / " + fullpath);

				if (!fname.equals("")) {
					// 서버에 파일 쓰기 작업
					FileOutputStream fs = new FileOutputStream(fullpath);
					fs.write(multipartfile.getBytes());
					fs.close();
				}
				filenames.add(fname); // 실 DB Insert 작업시 .. 파일명
			}

		}*/

		// DB저장작업
		// DB 저장할 파일 명
		/*n.setFileSrc(filenames.get(0)); // 파일명 1
		n.setFileSrc2(filenames.get(1)); // 파일명 2
*/		// 실DB저장
		// Mybatis 적용
		INotice noticeDao = sqlSession.getMapper(INotice.class);
		noticeDao.insertNotice(ndto);
		return "redirect:noticeList.htm";
		// return "notice.htm";
		// http://localhost:8090/SpringMVC_Basic_WebSiteBasic_Annotation_JdbcTemplate_06/customer/notice.htm
		// 요청 주소값 변화

		// POINT-1***********************************************
		// public String noticeReg(Notice n , HttpServletRequest request)
		// Parameter > Notice n 객체 타입
		// 글쓰기 화면 입력 > 함수(입력한 값)
		// 전제 : <input 태그 name="" 값하고 Notice 객체가 가지는 memberField명 같은 경우

		// POINT-2***********************************************
		// Spring 에서 파일 업로드
		// 웹 서버 upload 폴더 : 파일올리기 (IO)
		// DB : 파일명만 가지면 된다

		// <Form 태그에 속성으로 : enctype="multipart/form-data">

		// 1.의존 lib 추가 (fileupload , io)
		// C:\Kosta106th\Spring\Spring_Utils\Framework\3.0.2\spring-framework-3.0.2.RELEASE-dependencies
		// \org.apache.commons\com.springsource.org.apache.commons.fileupload

		// 2. VO , DTO 쪽에Spring 제공하는
		// CommonsMultipartFile 타입을 갖는 멤버 변수 추가하기 (setter, getter)

		// 3. 전송페이지에서 <form ... enctype="multipart/form-data" 설정
		// -<input type="file" name="file" 파일명 VO 객체 이름 동일 강제사항

		// 4. xml container 에
		// ***CommonsMultipartFile 반드시> id="multipartResolver"***
		// <bean id="multipartResolver"
		// class="org.springframework.web.multipart.commons.CommonsMultipartResolver"
		// >
		// <property name="maxUploadSize" value="10485760"/>
		// </bean>
	}

    //글상세보기
	 @RequestMapping("noticeDetail.htm")
	 public String noticeDetail(String seq , Model model ) throws ClassNotFoundException, SQLException{
		 
		 //Mybatis 적용
		 NoticeDao noticeDao = sqlsession.getMapper(NoticeDao.class);
		 Notice notice = noticeDao.getNotice(seq);
		 model.addAttribute("notice", notice);
		 //return "noticeDetail.jsp";
		 
		 //Tiles
		  return "customer.noticeDetail";
		 //View
		 //${notice.title}
	 }

}
