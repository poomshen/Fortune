package com.fortune.fileroom_Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fortune.Table_DTO.FileRoom_DTO;
import com.fortune.fileroom_DAO.IFileRoom;

@Controller
public class Upload_Controller {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value="/uploadfile.ajax", method=RequestMethod.POST ,produces="application/json")
	@ResponseBody
	public HashMap<String, Object> uploadFile(MultipartHttpServletRequest request) throws Exception {
		System.out.println("uploadFile 컨트롤러");
		HashMap<String, Object> result = new HashMap<String, Object>();
		MultipartFile mf = request.getFile("file");
		IFileRoom fileromm_DAO = sqlsession.getMapper(IFileRoom.class);
		String file_name = mf.getOriginalFilename();
		System.out.println("file_name : " + file_name);
		
		//확장자 구하는 부분
		int lastindexof = mf.getOriginalFilename().lastIndexOf(".");
		int length = mf.getOriginalFilename().length();
		String substr = mf.getOriginalFilename().substring(lastindexof, length);
		
		String upload_path = request.getSession().getServletContext().getRealPath("upload");
		File file = new File(upload_path + "/" + file_name);
		file = renameFile(file);
		
		//이름 변경 해주는 부분
		//for(int i = 0; i < list.size(); i++){
		//	if(list.get(i).getFilesrc().equals(fileName)){
				
				
				/*index++;
				int lastindexof = mf.getOriginalFilename().lastIndexOf(".");
				int length = mf.getOriginalFilename().length();
				//String[] str = mf.getOriginalFilename().split(".");
				String substr = mf.getOriginalFilename().substring(lastindexof, length);
				
				System.out.println("lastindexof : " + lastindexof);
				System.out.println("substr : " + substr);
				System.out.println("변경 (O) fileName : " + fileName);
				System.out.println("index : " + index);*/
		//	}
		//}
		/*	
		String uploadPath = request.getSession().getServletContext().getRealPath("upload");
		*/
		if (mf.getSize() != 0) {
			mf.transferTo(file);
		}
		
		//DB insert 하는 부분
		FileRoom_DTO fileroom_DTO = new FileRoom_DTO();
		fileroom_DTO.setFile_room_name(file.getName());
		fileroom_DTO.setFile_room_ext(substr);
		fileromm_DAO.insertFile(fileroom_DTO);
		
		//View 화면에 뿌려주기 위한 list
		int page = 1;
		int row_size =9;

		int total_count = fileromm_DAO.countFile();	//file 개수
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
		
		List<FileRoom_DTO> list = fileromm_DAO.listFiles(page);
		result.put("file", list);
		result.put("total_count", total_count);
		result.put("pg", page);
		result.put("all_page", all_page);
		result.put("block", block);
		result.put("from_page", from_page);
		result.put("to_page", to_page);
		
		return result;
	}
	
	public File renameFile(File f) { // File f는 원본 파일
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
	}
}