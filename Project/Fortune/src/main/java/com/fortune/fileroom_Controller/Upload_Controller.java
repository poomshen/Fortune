/*
작성자 : 김중완
최초 작업일 : 2016/11/14
최종 수정일 : 2016/11/20
*/
package com.fortune.fileroom_Controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.Table_DTO.Join_DTO;
import com.fortune.fileroom_DAO.IFileRoom;
import com.fortune.notice_Util.NoticeFile_Utils;

@Controller
public class Upload_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	//파일 업로드 컨트롤러 함수
	@RequestMapping(value="/uploadfile.ajax", method=RequestMethod.POST ,produces="application/json")
	@ResponseBody
	public HashMap<String, Object> uploadFile(HttpSession session, MultipartHttpServletRequest request) throws Exception {
		System.out.println("Upload_Controller/uploadFile함수");
		HashMap<String, Object> result = new HashMap<String, Object>();
		MultipartFile mf = request.getFile("file");												//파일
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));					//협업번호
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		String file_name = mf.getOriginalFilename();											//파일 실제 이름
		String originalFileExtension = file_name.substring(file_name.lastIndexOf("."));			//파일 확장자
		String storedFileName = NoticeFile_Utils.getRandomString() + originalFileExtension;		//랜덤 파일 이름
		
		////////////////////////// 파일 새로운 이름 //////////////////////////////////////
		String body = null;
		String ext = null;
		int dot = file_name.lastIndexOf(".");
		
		if (dot != -1) {
			body = file_name.substring(0, dot);
			ext = file_name.substring(dot);
		} else {
			body = file_name;
			ext = "";
		}

		int count = 0;
		String file_new_name = file_name;		
		
		while (!overlapName(fileromm_DAO, file_new_name, collabo_no) && count < 9999) {
			count++;
			file_new_name = body + "("+count+")" + ext;
		}
		////////////////////////////////////////////////////////////////////
		
		String filenamecut = NoticeFile_Utils.getFixString(file_new_name, 12);	//파일 이름 길면 ...으로 표시
		String upload_path = request.getSession().getServletContext().getRealPath("upload");	//파일 경로
		File file = new File(upload_path + "/" + storedFileName);
		
		if (mf.getSize() != 0) {
			mf.transferTo(file);
		}
		
		//DB insert 하는 부분
		Join_DTO join_DTO = (Join_DTO) session.getAttribute("info");
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		fileroom_DTO.setUser_id(join_DTO.getUser_id());
		fileroom_DTO.setFile_room_name(file_new_name);
		fileroom_DTO.setFile_room_ext(originalFileExtension);
		fileroom_DTO.setFile_room_rename(storedFileName);
		fileroom_DTO.setFile_room_cutname(filenamecut);
		fileroom_DTO.setCollabo_no(collabo_no);
		fileromm_DAO.insertFile(fileroom_DTO);
		
		//View 화면에 뿌려주기 위한 list
		String pg = request.getParameter("pg");
		int page = 1;
		String str_pg = pg;
		
		if (str_pg != null) {
			page = Integer.parseInt(str_pg);
		}
		
		int row_size = 12;
		int total_count = fileromm_DAO.countFile(collabo_no);	//file 개수
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		int block = 5; // 한페이지에 보여줄 범위
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		
		if (to_page > all_page) {
			to_page = all_page;
		}
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page, collabo_no);	//파일 리스트
		
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);
		result.put("collabo_no", collabo_no);
		
		return result;
	}
	
	//파일 이름 중복 검사
	public boolean overlapName(IFileRoom fileromm_DAO, String file_new_name, int collabo_no){
		
		System.out.println("Upload_Controller/overlapName함수");
		
		int overlapname = fileromm_DAO.selectOverlapNameFile(file_new_name, collabo_no);
		
		if(overlapname == 1){
			return false;
		}
		
		return true;
	}
}