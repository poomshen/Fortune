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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/uploadfile.ajax", method=RequestMethod.POST ,produces="application/json")
	@ResponseBody
	public HashMap<String, Object> uploadFile(HttpSession session, MultipartHttpServletRequest request) throws Exception {
		System.out.println("uploadFile 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		MultipartFile mf = request.getFile("file");
		int collabo_no = Integer.parseInt(request.getParameter("collabo_no"));
		System.out.println("collabo_no : " + collabo_no);
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		String file_name = mf.getOriginalFilename();
		System.out.println("file_name : " + file_name);
		
		String originalFileExtension = file_name.substring(file_name.lastIndexOf("."));
		String storedFileName = NoticeFile_Utils.getRandomString() + originalFileExtension;
		

		/////////////////////////////////////////////////////
		String body = null;
		String ext = null;
		
		int dot = file_name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 없을때
			body = file_name.substring(0, dot);
			ext = file_name.substring(dot);
		} else { // 확장자가 있을때
			body = file_name;
			ext = "";
		}

		int count = 0;
		String file_new_name = file_name;
		// 중복된 파일이 있을때
		// 파일이름뒤에 a숫자.확장자 이렇게 들어가게 되는데 숫자는 9999까지 된다.
		
		
		while (!overlapName(fileromm_DAO, file_new_name, collabo_no) && count < 9999) {
			System.out.println("몇번 타냐 : " + count);
			count++;
			file_new_name = body + "("+count+")" + ext;
		}
		////////////////////////////////////////////////////////////////////
		System.out.println("file_new_name : " + file_new_name);
		
		String filenamecut = NoticeFile_Utils.getFixString(file_new_name, 12);
		System.out.println("filenamecut : " + filenamecut);
		
		String upload_path = request.getSession().getServletContext().getRealPath("upload");
		File file = new File(upload_path + "/" + storedFileName);
		
		if (mf.getSize() != 0) {
			mf.transferTo(file);
		}
		
		//DB insert 하는 부분
		Join_DTO join_DTO = (Join_DTO) session.getAttribute("info");
		System.out.println("세션 user_id : " + join_DTO.getUser_id());
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
		System.out.println("totalcount : " + total_count);

		// ... 목록
		int all_page = (int) Math.ceil(total_count / (double) row_size); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + all_page);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int from_page = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int to_page = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (to_page > all_page) { // 예) 20>17
			to_page = all_page;
		}
		
		System.out.println("to_page : " + to_page);
		System.out.println("from_page : " + from_page);
		System.out.println("page : " + page);
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page, collabo_no);
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
	
	public boolean overlapName(IFileRoom fileromm_DAO, String file_new_name, int collabo_no){
		int overlapname = fileromm_DAO.selectOverlapNameFile(file_new_name, collabo_no);
		if(overlapname == 1){
			return false;
		}
		return true;
	}
	
	/*public File renameFile(File f) { // File f는 원본 파일
		if (createNewFile(f))
			return f; // 생성된 f가 중복되지 않으면 리턴

		String name = f.getName();
		String body = null;
		String ext = null;
		
		int dot = name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 없을때
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else { // 확장자가 있을때
			body = name;
			ext = "";
		}

		int count = 0;
		// 중복된 파일이 있을때
		// 파일이름뒤에 a숫자.확장자 이렇게 들어가게 되는데 숫자는 9999까지 된다.
		while (!createNewFile(f) && count < 9999) {
			count++;
			String newName = body + count + ext;
			f = new File(f.getParent(), newName);
		}
		return f;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile(); // 존재하는 파일이 아니면
		} catch (IOException ignored) {
			return false;
		}
	}*/
}